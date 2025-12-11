//
//  ycsbc.cc
//  YCSB-C
//
//  Created by Jinglei Ren on 12/19/14.
//  Copyright (c) 2014 Jinglei Ren <jinglei@ren.systems>.
//

#include <cstring>
#include <string>
#include <iostream>
#include <vector>
#include <future>
#include "core/utils.h"
#include "core/timer.h"
#include "core/client.h"
#include "core/core_workload.h"
#include "db/db_factory.h"
#include "lib/mem_alloc.h"

// #include "gem5/m5ops.h"
// #define M5OPS

using namespace std;

void UsageMessage(const char *command);
bool StrStartWith(const char *str, const char *pre);
string ParseCommandLine(int argc, const char *argv[], utils::Properties &props);

int DelegateClient(ycsbc::DB *db, ycsbc::CoreWorkload *wl, const int num_ops,
    bool is_loading) {
  db->Init();
  ycsbc::Client client(*db, *wl);
  int oks = 0;
  for (int i = 0; i < num_ops; ++i) {
    if (is_loading) {
      oks += client.DoInsert();
    } else {
      oks += client.DoTransaction();
    }
  }
  db->Close();
  return oks;
}



int main(const int argc, const char *argv[]) {


  printf("Hello YSCB-C\n");
  utils::Properties props;
  string file_name = ParseCommandLine(argc, argv, props);

  ycsbc::DB *db = ycsbc::DBFactory::CreateDB(props);
  if (!db) {
    cout << "Unknown database name " << props["dbname"] << endl;
    exit(0);
  }

  ycsbc::CoreWorkload wl;
  wl.Init(props);

  const int num_threads = stoi(props.GetProperty("threadcount", "1"));
  const int remote = stoi(props.GetProperty("remote", "0"));
  const int noload = stoi(props.GetProperty("noload", "0"));
  const int norun = stoi(props.GetProperty("norun", "0"));
  const int checkpoint = stoi(props.GetProperty("checkpoint", "0"));

  if (InitMemAlloc(1024 * 1024 * 800, remote)) {
    cout << "Memory allocation failed." << endl;
    exit(0);
  }


  vector<future<int>> actual_ops;
  int total_ops = 0;

  // Loading phase ----------------------------------------------------
  
  if (!noload) {
    total_ops = stoi(props[ycsbc::CoreWorkload::RECORD_COUNT_PROPERTY]);
  
  #ifdef M5OPS
    // m5_dump_reset_stats(0, 0);
    // m5_reset_stats(0, 0);
  #endif

    for (int i = 0; i < num_threads; ++i) {
      actual_ops.emplace_back(async(launch::async,
          DelegateClient, db, &wl, total_ops / num_threads, true));
    }

  #ifdef M5OPS
    // m5_dump_reset_stats(0, 0);
  #endif

    assert((int)actual_ops.size() == num_threads);

    int sum = 0;
    for (auto &n : actual_ops) {
      assert(n.valid());
      sum += n.get();
    }
    cerr << "# Done loading records: \t" << sum << endl;
    actual_ops.clear();
  }
  // --------------------------------------------------------------------

#ifdef M5OPS
    if (checkpoint)
      m5_checkpoint(0, 0);
#endif

  // Run phase ---------------------------------------------------------
  
  if (!norun) {
    total_ops = stoi(props[ycsbc::CoreWorkload::OPERATION_COUNT_PROPERTY]);
    utils::Timer<double> timer;
    timer.Start();

  #ifdef M5OPS
    // m5_dump_reset_stats(0, 0);
    m5_reset_stats(0, 0);
  #endif
    for (int i = 0; i < num_threads; ++i) {
      actual_ops.emplace_back(async(launch::async,
          DelegateClient, db, &wl, total_ops / num_threads, false));
    }

  #ifdef M5OPS
    m5_dump_reset_stats(0, 0);
  #endif

    assert((int)actual_ops.size() == num_threads);

    int sum = 0;
    for (auto &n : actual_ops) {
      assert(n.valid());
      sum += n.get();
    }
    double duration = timer.End();
    cerr << "# Transaction throughput (KTPS)" << endl;
    cerr << props["dbname"] << '\t' << file_name << '\t' << num_threads << '\t';
    cerr << total_ops / duration / 1000 << endl;
  }
  // --------------------------------------------------------------------

  if (CloseMemAlloc()) {
    cout << "Memory deallocation failed." << endl;
    exit(0);
  }

}

string ParseCommandLine(int argc, const char *argv[], utils::Properties &props) {
  int argindex = 1;
  string filename;
  while (argindex < argc && StrStartWith(argv[argindex], "-")) {
    if (strcmp(argv[argindex], "-threads") == 0) {
      argindex++;
      if (argindex >= argc) {
        UsageMessage(argv[0]);
        exit(0);
      }
      props.SetProperty("threadcount", argv[argindex]);
      argindex++;
    } else if (strcmp(argv[argindex], "-db") == 0) {
      argindex++;
      if (argindex >= argc) {
        UsageMessage(argv[0]);
        exit(0);
      }
      props.SetProperty("dbname", argv[argindex]);
      argindex++;
    } else if (strcmp(argv[argindex], "-host") == 0) {
      argindex++;
      if (argindex >= argc) {
        UsageMessage(argv[0]);
        exit(0);
      }
      props.SetProperty("host", argv[argindex]);
      argindex++;
    } else if (strcmp(argv[argindex], "-port") == 0) {
      argindex++;
      if (argindex >= argc) {
        UsageMessage(argv[0]);
        exit(0);
      }
      props.SetProperty("port", argv[argindex]);
      argindex++;
    } else if (strcmp(argv[argindex], "-slaves") == 0) {
      argindex++;
      if (argindex >= argc) {
        UsageMessage(argv[0]);
        exit(0);
      }
      props.SetProperty("slaves", argv[argindex]);
      argindex++;
    } else if (strcmp(argv[argindex], "-remote") == 0) {
      props.SetProperty("remote", "1");
      argindex++;
    } else if (strcmp(argv[argindex], "-noload") == 0) {
      props.SetProperty("noload", "1");
      argindex++;
    } else if (strcmp(argv[argindex], "-norun") == 0) {
      props.SetProperty("norun", "1");
      argindex++;
    } else if (strcmp(argv[argindex], "-checkpoint") == 0) {
      props.SetProperty("checkpoint", "1");
      argindex++;
    }
    else if (strcmp(argv[argindex], "-P") == 0) {
      argindex++;
      if (argindex >= argc) {
        UsageMessage(argv[0]);
        exit(0);
      }
      filename.assign(argv[argindex]);
      ifstream input(argv[argindex]);
      try {
        props.Load(input);
      } catch (const string &message) {
        cout << message << endl;
        exit(0);
      }
      input.close();
      argindex++;
    } else {
      cout << "Unknown option '" << argv[argindex] << "'" << endl;
      exit(0);
    }
  }

  if (argindex == 1 || argindex != argc) {
    UsageMessage(argv[0]);
    exit(0);
  }

  return filename;
}

void UsageMessage(const char *command) {
  cout << "Usage: " << command << " [options]" << endl;
  cout << "Options:" << endl;
  cout << "  -threads n: execute using n threads (default: 1)" << endl;
  cout << "  -db dbname: specify the name of the DB to use (default: basic)" << endl;
  cout << "  -P propertyfile: load properties from the given file. Multiple files can" << endl;
  cout << "                   be specified, and will be processed in the order specified" << endl;
}

inline bool StrStartWith(const char *str, const char *pre) {
  return strncmp(str, pre, strlen(pre)) == 0;
}

