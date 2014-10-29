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
        id: -1,
        numerobaguete: "No"
      )
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
        id: -1,
        name: "No",
        reference: "No"
      )
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
      
 puts "===> Sample date have been set in DB Articles !"
    
    Fournisseur.create!(
        id: -1,
        name_company: "No",
        nom: "No",
        prenom: "No",
        phone: "No",
        address: "No",
        email: "No"
      )
  Fournisseur.create!(
        name_company: "TOTAL",
        nom: "Abdoul kader",
        prenom: "Sacko",
        phone: "76 43 83 41",
        address: "Lafiabougou",
        email: "sackoabdoulkader@live.fr"
      )
 Fournisseur.create!(
        name_company: "E.D.M",
        nom: "Moussa",
        prenom: "CAMARA",
        phone: "76 43 83 41",
        address: "Lafiabougou",
        email: "sackoabdoulkader@live.fr"
      )
 Fournisseur.create!(
        name_company: "TOTAL",
        nom: "Abdoul kader",
        prenom: "Sacko",
        phone: "76 43 83 41",
        address: "Lafiabougou",
        email: "sackoabdoulkader@live.fr"
      )
 puts "===> Sample date have been set in DB  Fournisseurs!"

 Boutique.create!(
        id: -1,
        name: "No",
        phone: "No",
        address: "No"
      )
 Boutique.create!(
        name: "SIKASSO",
        phone: "88 88 88 88",
        address: "WAYERMA"
      )
 Boutique.create!(
        name: "BANCONI",
        phone: "88 88 88 88",
        address: "RUE 456 PORTE 345"
      )
 puts "===> Sample date have been set in DB  Boutique!"

 Client.create!(
        id: -1,
        nom: "No",
        prenom: "No",
        phone: "No",
        address: "No",
        email: "No"
      )
 Client.create!(
        nom: "CLIENT-1",
        prenom: "CLIENT-1",
        phone: "88 88 88 88",
        address: "RUE 456 PORTE 345",
        email: "exemple-1@exemple_ex"
      )
 Client.create!(
        nom: "CLIENT-2",
        prenom: "CLIENT-2",
        phone: "88 88 88 88",
        address: "RUE 456 PORTE 345",
        email: "exemple-2@exemple_ex"
      )
 Client.create!(
        nom: "CLIENT-3",
        prenom: "CLIENT-3",
        phone: "88 88 88 88",
        address: "RUE 456 PORTE 345",
        email: "exemple-3@exemple_ex"
      )
 Client.create!(
        nom: "CLIENT-4",
        prenom: "CLIENT-4",
        phone: "88 88 88 88",
        address: "RUE 456 PORTE 345",
        email: "exemple-4@exemple_ex"
      )
 Client.create!(
        nom: "CLIENT-5",
        prenom: "CLIENT-5",
        phone: "88 88 88 88",
        address: "RUE 456 PORTE 345",
        email: "exemple-5@exemple_ex"
      )
 puts "===> Sample date have been set in DB  Client!"

 Employe.create!(
        nom: "EMPLOYEE-1",
        prenom: "EMPLOYEE-1",
        sexe: "m",
        phone: "88 88 88 88",
        address: "RUE 456 PORTE 345",
        email: "exemple-1@exemple_ex"
      )
 Employe.create!(
        nom: "EMPLOYEE-2",
        prenom: "EMPLOYEE-2",
        sexe: "f",
        phone: "88 88 88 88",
        address: "RUE 456 PORTE 345",
        email: "exemple-2@exemple_ex"
      )
 Employe.create!(
        nom: "EMPLOYEE-3",
        prenom: "EMPLOYEE-3",
        sexe: "m",
        phone: "88 88 88 88",
        address: "RUE 456 PORTE 345",
        email: "exemple-3@exemple_ex"
      )
 puts "===> Sample date have been set in DB  Employées!"

  end
  
end