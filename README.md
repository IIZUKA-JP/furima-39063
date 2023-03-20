### users_table

|Column            |Type  |Options                      |
|------------------|------|-----------------------------|
|family_name       |string|null: false                  |
|first_name        |string|null: false                  |
|family_name_kana  |string|null: false                  |
|first_name_kana   |string|null: false                  |
|nickname          |string|null: false                  |
|email             |string|null: false ,unique_key: true|
|encrypted_password|string|null: false                  |
|birth_day         |date  |null: false                  |

### Association
has_many :purchaser_records
has_many :items

### items_table

|Column             |Type     |Options                      |
|-------------------|---------|-----------------------------|
|product_name       |string   |null: false                  |
|category_id        |integer  |null: false                  |
|price              |integer  |null: false                  |
|explanation        |text     |null: false                  |
|condition_id       |integer  |null: false                  |
|delivery_charge_id |integer  |null: false                  |
|delivery_day_id    |integer  |null: false                  |
|Region_of_origin_id|integer  |null: false                  |


### Association

has_one :purchaser_record
belongs_to :user 


### purchaser_record_table

|Column       |Type      |Options                       |
|-------------|----------|------------------------------|
|user         |references|null: false, foreign_key: true|
|purchase date|DATETIME  |null: false                   |

### Association

has_one :delivery_address
belongs_to :items 



### delivery_address

|Column           |Type      |Options                        |
|-----------------|----------|-------------------------------|
|user             |references|null: false, foreign_key: true |
|post_code        |INTEGER(7)|null: false                    |
|prefectures      |string    |null: false                    |
|city             |string    |null: false                    |
|address          |string    |null: false                    |
|building         |text      |null: false                    |
|tel              |string    |null: false                    |


### Association
belongs_to :purchaser_record