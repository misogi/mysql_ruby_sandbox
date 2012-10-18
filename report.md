
```sql
mysql> explain SELECT `tags`.* FROM `tags` INNER JOIN `taggings` ON ((`taggings`.`tag_id` = `tags`.`id`) AND (`taggings`.`product_id` = 35))\G
*************************** 1. row ***************************
           id: 1
  select_type: SIMPLE
        table: taggings
         type: ref
possible_keys: tag_id,product_id
          key: product_id
      key_len: 5
          ref: const
         rows: 8
        Extra: Using where
*************************** 2. row ***************************
           id: 1
  select_type: SIMPLE
        table: tags
         type: eq_ref
possible_keys: PRIMARY
          key: PRIMARY
      key_len: 4
          ref: sandbox.taggings.tag_id
         rows: 1
        Extra: 
2 rows in set (0.00 sec)
```
