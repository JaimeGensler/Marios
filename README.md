# Mario's Specialty Foods

#### _A website to display food products and reviews - now with authentication! - Jan. 26, 2020_

#### By _Jaime Gensler_


## Description
_Mario's Specialty Cuisine allows only admins to create new food products and reviews for those products. Normal users are then able to add their own reviews for these products - but only if they're signed in! Full specs are listed below:_

| SPEC                              | EXAMPLE INPUT               | EXAMPLE OUTPUT             |
|-----------------------------------|-----------------------------|----------------------------|
| (Only) admins can create products | New Product => 'kimchi'     | kimchi, from Japan, $3.50  |
| (Only) admins can update products | 'kimchi' => 'KimChi'        | KimChi, from Japan, $3.50  |
| (Only) admins can delete products | Delete 'KimChi'             | KimChi and reviews deleted |
| Guest users can add reviews       | 'Kimchi is good, 4/5 stars' | KimChi, avg. 4/5 stars     |

## Setup/Installation Requirements

_IMPORTANT NOTICE: One admin account is created when the database is seeded. The username, email, and password for this account are all 'admin'_

* _Clone this github repository_
* _CD into the repository_
* _Run 'gem install bundler'_
* _Run 'bundle'_
* _Run 'rake routes'_
* _Run 'rake db:create'_
* _Run 'rake db:migrate'_
* _Run 'rake db:seed'_
* _Run 'rails s'_
* _Enjoy!_


## Support and contact details

_For questions, comments, complaints, or confessions, please reach out to me at: <jaimegensler0@gmail.com>_


## Technologies Used

* _Ruby_
* _Rails_
* _rspec_
* _bcrypt_


### License

This software is licensed under the MIT License.

Copyright (c) 2019 **_Jaime Gensler_**
