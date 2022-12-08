s = box.schema.space.create('user')
s:format({
  {name = 'id', type = 'unsigned'},
  {name = 'name', type = 'string'},
  {name = 'surname', type = 'string'},
  {name = 'patronymic', type = 'string'},
  {name = 'date_of_birth', type = 'string'},
  {name = 'avatar', type = 'string'},
  {name = 'estimate', type = 'double'},
  {name = 'email', type = 'string'},
  {name = 'phone', type = 'string'},
  {name = 'sex', type = 'boolean'},
  {name = 'city', type = 'string'},
  {name = 'education', type = 'string'}
})
s:create_index('primary', {
  type = 'hash',
  parts = {'id'}
})
s:create_index('secondary', {
  type = 'hash',
  parts = {'name', 'surname', 'patronymic'}
})


s = box.schema.space.create('publication')
s:format({
  {name = 'id', type = 'unsigned'},
  {name = 'user_id', type = 'unsigned'},
  {name = 'type', type = 'unsigned'},
  {name = 'sentiment', type = 'unsigned'},
  {name = 'date', type = 'string'},
  {name = 'date', type = 'string'},
  {name = 'link', type = 'string'},
  {name = 'content', type = 'string'},
})
s:create_index('primary', {
  type = 'hash',
  parts = {'id'}
})
s:create_index('secondary', {
  type = 'hash',
  parts = {'user_id'}
})

s = box.schema.space.create('mention')
s:format({
  {name = 'id', type = 'unsigned'},
  {name = 'user_id', type = 'unsigned'},
  {name = 'sentiment', type = 'unsigned'},
  {name = 'date', type = 'string'},
  {name = 'link', type = 'string'},
  {name = 'content', type = 'string'}
})
s:create_index('primary', {
  type = 'hash',
  parts = {'id'}
})

s = box.schema.space.create('friend')
s:format({
  {name = 'first_user_id', type = 'unsigned'},
  {name = 'second_user_id', type = 'unsigned'},
  {name = 'id', type = 'unsigned'}
})
s:create_index('primary', {
  type = 'hash',
  parts = {'id'}
})
