# Lab 1 - Bases de Dados Chave-Valor

## Estruturas de dados utilizadas
1. **Set**
2. **List**

## Funções usadas da biblioteca Jedis
1. **sadd(_key_, _value_)**
2. **srem(_key_, _value_)**
3. **rpush(_key_, _value_)**
4. **lrem(_key_, _value_)**
5. **del(_key_)**
6. **sismember(_key_, _value_)**
7. **smembers(_key_, _value_)**
8. **lrange(_key_, _initial-index_, _last-index_)**

## App
Ao desenvolver esta app comecei por criar um set _(key=users, value=username)_ para guardar o nome de todos os users, assim consigo saber quantos users existe na database. Existe uma lista para cada user _(key=username, value=post)_ no qual consigo guardar os posts de cada user. Por fim existe um set para cada user _(key=username + "follows", value=username)_ para eu saber quem está a seguir quem.
Utilizo _sadd(key, value)_ para adiocionar utilizadores a database e para adicionar uma ligação com user a ser seguido, para adicionar posts utilizo _rpush(key, value)_. Para remover um user da database, em primeiro removo do set _(key=user)_ com a função _srem(key)_, apagar da database a lista _(key=username)_ e o set _(key=username + "follows")_ criados para esse user utilizando a função _del(key)_. Por fim se um dos outros users estiver a seguir o user eliminado, remover dos sets _(key=username + "follows")_ com _srem(key)_ o user eliminado.
Utilizo a função _sismember(key, value)_ para ver se um dado elemento existe numa lista ou num set.
Para listar o conteúdo de um set uso a função _smembers(key)_ e para uma listar o conteúdo de uma lista uso a função _lrange(key, initial-index, last-index)_.

- Com estes sets e listas criados e com as funções da biblioteca Jedis desenvolvi as seguintes funcionalidades:
1. **Adicionar um user a database**
2. **Listar todos os user existentes na database**
3. **Remover um user da database**
4. **Escolher um user**

- Ao escolher um user é apresentado as seguintes funcionalidades:
1. **Adicionar um post**
2. **Listar os posts**
3. **Remover os posts**
4. **Seguir um outro user**
5. **Listar os users que se está a seguir**
6. **Listar os posts dos user que se está a seguir**