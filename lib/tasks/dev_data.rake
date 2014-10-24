# encoding: utf-8

namespace :dev_data do
  desc "Fill database with sample data"
  task create: :environment do
    
    Rake::Task['db:reset'].invoke

    Formatphoto.create!(
        dimention: "10*15"
      )

    Formatphoto.create!(
        dimention: "15*21"
      )

    Formatphoto.create!(
        dimention: "20*25"
      )

    Formatphoto.create!(
        dimention: "21*30"
      )

    Formatphoto.create!(
        dimention: "24*30"
      )

    Formatphoto.create!(
        dimention: "30*40"
      )

    Formatphoto.create!(
        dimention: "30*45"
      )

    Formatphoto.create!(
        dimention: "40*50"
      )

    Formatphoto.create!(
        dimention: "40*60"
      )

    Formatphoto.create!(
        dimention: "50*60"
      )

    Formatphoto.create!(
        dimention: "50*70"
      )

    Formatphoto.create!(
        dimention: "60*80"
      )

    Formatphoto.create!(
        dimention: "60*90"
      )

    Formatphoto.create!(
        dimention: "120*80"
      )

   puts "===> Sample date have been set in Format Photo !"      

    Cadre.create!(
        numerobaguete: "E6"
      )
    Cadre.create!(
        numerobaguete: "E7"
      )
    Cadre.create!(
        numerobaguete: "E8"
      )
    Cadre.create!(
        numerobaguete: "D7"
      )
    Cadre.create!(
        numerobaguete: "C7"
      )
    Cadre.create!(
        numerobaguete: "C9"
      )
    Cadre.create!(
        numerobaguete: "D8"
      )
    Cadre.create!(
        numerobaguete: "B6"
      )
    Cadre.create!(
        numerobaguete: "B8"
      )
    Cadre.create!(
        numerobaguete: "C10"
      )
    Cadre.create!(
        numerobaguete: "C8"
      )
    Cadre.create!(
        numerobaguete: "B7"
      )
    Cadre.create!(
        numerobaguete: "F5"
      )
    Cadre.create!(
        numerobaguete: "C5"
      )
    Cadre.create!(
        numerobaguete: "B8"
      )
    Cadre.create!(
        numerobaguete: "C11"
      )
    Cadre.create!(
        numerobaguete: "B9"
      )
    Cadre.create!(
        numerobaguete: "C13"
      )
    Cadre.create!(
        numerobaguete: "C12"
      )
    Cadre.create!(
        numerobaguete: "E9"
      )
    Cadre.create!(
        numerobaguete: "F6"
      )
 puts "===> Sample date have been set in Cadre !"
 
 Article.create!(
        name: "ALBUM",
        reference: "10"
      )
 Article.create!(
        name: "ALBUM",
        reference: "20"
      )
 Article.create!(
        name: "ALBUM",
        reference: "30"
      )
 Article.create!(
        name: "ALBUM",
        reference: "50"
      )
 Article.create!(
        name: "ALBUM",
        reference: "200"
      )
 Article.create!(
        name: "ALBUM",
        reference: "240"
      )
 Article.create!(
        name: "ALBUM",
        reference: "300"
      )
 Article.create!(
        name: "PELICULE",
        reference: "667 NOIR & BLANC"
      )
 Article.create!(
        name: "PELICULE",
        reference: "667 COULEUR"
      )
 Article.create!(
        name: "PELICULE",
        reference: "FUJI 135/36"
      )
 Article.create!(
        name: "CADRE INDUSTRIEL",
        reference: "10*15"
      )
 Article.create!(
        name: "CADRE INDUSTRIEL",
        reference: "20*25"
      )
      
 puts "===> Sample date have been set in DB !"
    
  end
  
end