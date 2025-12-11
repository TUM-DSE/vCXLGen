

#include <iostream>
#include <stdlib.h>
#include <cstring>
#include <sys/mman.h>
#include "mem_alloc.h"
#include <mutex>


void *memory;
const int MAX_SIZE = 1024 * 1024 * 1024 * 1;
std::size_t _size;
bool _remote;
int _current_size = 0;
std::mutex mutex_;

// #define USE_MMAP
// #define PRINT_DEBUG


int InitMemAlloc(size_t size, int remote)
{
    if (size > MAX_SIZE)
    {
        return -1;
    }
    _size = size;
    _remote = (bool)remote;

    if (_remote) {
        memory = (void*)0x10000000;
    }
    else 
    {
#if defined(USE_MMAP)
    memory = mmap(NULL, _size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
#else
    memory = malloc(_size);
#endif
    }

    cout << "InitMemAlloc: " << _size << " memory:" << memory << " remote:" << _remote << endl;


    _current_size = 0;
    if (memory == NULL)
    {
        return -1;
    }
    return 0;
}
int CloseMemAlloc()
{
    if (_remote) {
        return 0;
    }

#if defined(USE_MMAP)
    munmap(memory, _size);
#else
    free(memory);
#endif
    return 0;
}

void *MyMemAlloc::Malloc(std::size_t size)
{

    if (_current_size + size > _size) {
        cout << "!!!!!!!! OOM !!!!!!!" << endl;
        exit(0);
    }
    std::lock_guard<std::mutex> lock(mutex_);
    void *p = (void *)((char *)memory + _current_size);
    _current_size += size;
#ifdef PRINT_DEBUG
    cout << "MyMemAlloc::Malloc: " << size << " p:" << p << " remaining: " << MAX_SIZE - _current_size << endl;
#endif
    return p;
}

// template <typename T>
// void MyMemAlloc::Free(T *p, std::size_t size)
// {
//     cout << "MyMemAlloc::Free: " << p << "to " << size << endl;
// }

template <typename T, typename... Arguments>
T *MyMemAlloc::New(Arguments... args)
{
    // cout << "MyMemAlloc::New: " << endl;
    return new T(args...);
}

template <typename T>
void MyMemAlloc::Delete(T *p)
{
    // cout << "MyMemAlloc::Delete: " << p << endl;
    return delete p;
}
