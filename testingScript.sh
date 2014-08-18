//Testing Script

//Create three users
curl -i -H "Content-type: application/json" -X POST http://ware.sqrawler.com:3000/users -d '{"user": {"email":"test1@foo.com", "name":"User 1", "password":"testUser1"}}'
curl -i -H "Content-type: application/json" -X POST http://ware.sqrawler.com:3000/users -d '{"user": {"email":"test2@foo.com", "name":"User 2", "password":"testUser2"}}'
curl -i -H "Content-type: application/json" -X POST http://ware.sqrawler.com:3000/users -d '{"user": {"email":"test3@foo.com", "name":"User 3", "password":"testUser3"}}'

//Create five splatts for each user, mixing chronological order

curl -i -H "Content-type: application/json" -X POST http://ware.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Hello, Splatter world", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://ware.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Hello, Splatter world", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://ware.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Hello, Splatter world", "user_id":3}}'
curl -i -H "Content-type: application/json" -X POST http://ware.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Splatt!", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://ware.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Splatter!", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://ware.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Im Splatting!", "user_id":3}}'
curl -i -H "Content-type: application/json" -X POST http://ware.sqrawler.com:3000/splatts -d '{"splatt": {"body":"My third Splatt", "user_id":3}}'
curl -i -H "Content-type: application/json" -X POST http://ware.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Third Splatt complete!", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://ware.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Heres my third Splatt", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://ware.sqrawler.com:3000/splatts -d '{"splatt": {"body":"User 2, Splatt four!", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://ware.sqrawler.com:3000/splatts -d '{"splatt": {"body":"User 1, Splatt four!", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://ware.sqrawler.com:3000/splatts -d '{"splatt": {"body":"My User three Splatt four!", "user_id":3}}'
curl -i -H "Content-type: application/json" -X POST http://ware.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Last user one Splatt!", "user_id":1}}'
curl -i -H "Content-type: application/json" -X POST http://ware.sqrawler.com:3000/splatts -d '{"splatt": {"body":"User twos last Splatt", "user_id":2}}'
curl -i -H "Content-type: application/json" -X POST http://ware.sqrawler.com:3000/splatts -d '{"splatt": {"body":"Last user three Splatt!", "user_id":3}}'

//first user following other two

curl -i -H "Content-type: application/json" -X POST http://ware.sqrawler.com:3000/users/follows -d '{"id": 1, "follows_id": 2}'
curl -i -H "Content-type: application/json" -X POST http://ware.sqrawler.com:3000/users/follows -d '{"id": 1, "follows_id": 3}'


//first user splatts

curl -i -H "Content-type: application/json" -X GET http://ware.sqrawler.com:3000/users/splatts/1

//gets users followed by first user

curl -i -H "Content-type: application/json" -X GET http://ware.sqrawler.com:3000/users/follows/1

//first users news feed

curl -i -H "Content-type: application/json" -X GET http://ware.sqrawler.com:3000/users/splatts-feed/1

//first user unfollow third user

curl -i -H "Content-type: application/json" -X DELETE http://ware.sqrawler.com:3000/users/1/3


//user 1 news feed after unfollowing third user

curl -i -H "Content-type: application/json" -X GET http://ware.sqrawler.com:3000/users/splatts-feed/1
