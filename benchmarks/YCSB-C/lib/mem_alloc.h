//
//  mem_alloc.h
//
//  Created by Jinglei Ren on 12/23/14.
//  Copyright (c) 2014 Jinglei Ren <jinglei@ren.systems>.
//

#ifndef VM_PERSISTENCE_MEM_ALLOC_H_
#define VM_PERSISTENCE_MEM_ALLOC_H_

#include <cstring>
#include <iostream>
using std::cout;
using std::endl;



struct MemAlloc {
  // static void *Malloc(std::size_t size) { return malloc(size); }
    static void *Malloc(std::size_t size) { 
    return malloc(size); 
  }

  // template <typename T>
  // static void Free(T *p, std::size_t size) { free((void *)p); }

template <typename T>
  static void Free(T *p, std::size_t size) { 
    free((void *)p); 
  }


  template <typename T, typename... Arguments>
  static T *New(Arguments... args) { return new T(args...); }

  template <typename T>
  static void Delete(T *p) { return delete p; }
};





extern void* memory;

int InitMemAlloc(size_t size, int remote);
int CloseMemAlloc();



// struct MyMemAlloc {
//   static void *Malloc(std::size_t size) { 
//     cout << "MyMemAlloc::Malloc: " << size << endl;
//     return malloc(size); 
//   }

//   template <typename T>
//   static void Free(T *p, std::size_t size) { 
//     cout << "MyMemAlloc::Free: " << p << size << endl;
//     free((void *)p); 
//   }

//   template <typename T, typename... Arguments>
//   static T *New(Arguments... args) { 
//     cout << "MyMemAlloc::New: " << endl;
//     return new T(args...); }

//   template <typename T>
//   static void Delete(T *p) { 
//     cout << "MyMemAlloc::Delete: " << p << endl;
//     return delete p; }
// };



struct MyMemAlloc {
  static void *Malloc(std::size_t size);

  template <typename T>
  static void Free(T *p, std::size_t size)
{
    cout << "MyMemAlloc::Free: " << p << "to " << size << endl;
}

  template <typename T, typename... Arguments>
  static T *New(Arguments... args);

  template <typename T>
  static void Delete(T *p);
};




#endif // VM_PERSISTENCE_MEM_ALLOC_H_

