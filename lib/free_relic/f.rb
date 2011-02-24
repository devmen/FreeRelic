require 'yaml'
a = {'development'=>{"auth"=>{"active"=>true, "login"=> 'root', "password"=>'root'}}, 'test'=>{"auth"=>{"active"=>true, "login"=> 'root', "password"=>'root'}}, 'production'=>{"auth"=>{"active"=>true, "login"=> 'root', "password"=>'root'}}}.to_yaml

puts a