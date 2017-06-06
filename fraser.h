
#ifndef FRASER_H_
#define FRASER_H_
#include "skiplist.h"
#include "ssalloc.h"
 
int fraser_find(sl_intset_t *set, slkey_t key, val_t *val);
int fraser_remove(sl_intset_t *set, slkey_t key, val_t *val, int remove_succ);
int fraser_insert(sl_intset_t *set, slkey_t key, val_t v);

inline int is_marked(uintptr_t i);
inline uintptr_t unset_mark(uintptr_t i);
inline uintptr_t set_mark(uintptr_t i);
inline void fraser_search(sl_intset_t *set, slkey_t key, sl_node_t **left_list, sl_node_t **right_list);
inline void mark_node_ptrs(sl_node_t *n);
#endif // FRASER_H_
