
#include "fraser.h"
#include "linden.h"

int sl_contains(sl_intset_t *set, slkey_t key, int transactional);
int sl_contains_val(sl_intset_t *set, slkey_t key, val_t *val, int transactional);
int sl_add(sl_intset_t *set, slkey_t key, int transactional);
int sl_add_val(sl_intset_t *set, slkey_t key, val_t val, int transactional);
int sl_remove(sl_intset_t *set, slkey_t key, int transactional);
int sl_remove_val(sl_intset_t *set, slkey_t key, val_t *val, int transactional);
int sl_remove_succ(sl_intset_t *set, slkey_t key, int transactional);
int sl_remove_succ_val(sl_intset_t *set, slkey_t key, val_t *val, int transactional);

// priority queue
int lotan_shavit_delete_min_key(sl_intset_t *set, slkey_t *key, val_t *val, thread_data_t *d);
int lotan_shavit_delete_min(sl_intset_t *set, val_t *val, thread_data_t *d);
int spray_delete_min_key(sl_intset_t *set, slkey_t *key, val_t *val, thread_data_t *d);
int spray_delete_min(sl_intset_t *set, val_t *val, thread_data_t *d);
