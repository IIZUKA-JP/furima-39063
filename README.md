### users_tabel

|Column          |Type  |Options                      |
|----------------|------|-----------------------------|
|family_name     |string|null: false                  |
|first_name      |string|null: false                  |
|family_name_kana|string|null: false                  |
|first_name_kana |string|null: false                  |
|nickname        |string|null: false                  |
|email           |string|null: false ,unique_key: true|
|password        |string|null: false                  |
|birth_day       |date  |null: false                  |

### Association
has_many :purchaser_record
has_many :items

### items_tabel

|Column          |Type     |Options                      |
|----------------|---------|-----------------------------|
|prodauct_name   |string   |null: false                  |
|category        |string   |null: false                  |
|price           |integer  |null: false                  |
|explanation     |text     |null: false                  |
|condition       |string   |null: false                  |
|delivery_chage  |integer  |null: false                  |
|delivery_day    |DATETIME |null: false                  |
|Region_of_origin|string   |null: false                  |


### Association

has_one :purchaser_record
belongs_to :user 


### purchaser_record_tabel

|Column       |Type      |Options                       |
|-------------|----------|------------------------------|
|user         |references|null: false, foreign_key: true|
|purchase date|DATETIME  |null: false                   |

### Association

has_one :delivery_address
belongs_to :items 



### delivery_address

|Column           |Type      |Options       |
|-----------------|----------|--------------|
|post_code        |INTEGER(7)|null: false   |
|prefectures      |string    |null: false   |
|cities           |string    |null: false   |
|prefectures_kana |string    |null: false   |
|city_kana        |string    |null: false   |
|adress           |text      |null: false   |
|buildding        |text      |null: false   |
|tel              |text      |null: false   |


### Association
belongs_to :purchaser_record