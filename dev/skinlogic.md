### Skins logic

User send request to upload skin and check if user have permission to upload skin HD skin if yes then upload HD skin if no then upload normal skin with parameters

### Skin lib
```sql
INSERT INTO `skins_lib` (`id`, `uid`, `name`, `fn`, `slim`) VALUES
(1, 123456789012345678, 'Default Skin', '550e8400-e29b-41d4-a716-446655440000'),
```

### Skin user
```sql
INSERT INTO `skins_user` (`id`, `uid`, `skin_id`, `uuid`, `slim`, `locked`) VALUES
(1, 123456789012345678, 1, '00000000-0000-0000-0000-000000000000', 0, 0),
```

id - skin id
uuid - user uuid
slim - 1 or 0
locked - 1 or 0