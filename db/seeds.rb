unless Rol.where(:code => "administrator").exists?
  Rol.create({
    :code => "administrator",
    :name => "Administrator/Adminisrador",
    :description => "Administrator"
  })
end
unless Population.where(:type_population => "adult").exists?
  Population.create ({
    :type_population => "adult",
    :age_init => "18",
    :age_end => "59"
  })
end
unless Activity.where(:name => "pin pon").exists?
  Activity.create ({
    :event_date => "2019-12-26",
    :name => "pin pon",
    :descrption => "pin pon",
    :place => "parque",
    :populations_id => Population.first.id
  })
end
unless User.where(:email => "angie@gmail.com").exists?
  User.create({
    :name => "Angie",
    :last_name => "Palacios",
    :date_birth => "2000-04-16",
    :email => "angie@gmail.com",
    :password => "123456",
    :password_confirmation => "123456",
    :activities_id => Activity.first.id,
    :rol_id => Rol.first.id
  })
end