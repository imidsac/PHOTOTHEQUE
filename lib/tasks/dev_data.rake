# encoding: utf-8

namespace :dev_data do
  desc "Fill database with sample data"
  task create: :environment do
    
    Rake::Task['db:reset'].invoke

    User.create!(
        id: -1000,
        username: "root",
        email: "imidsac@hotmail.fr",
        nom: "SACKO",
        prenom: "IDRISS",
        role: "Root",
        password: "walilahilhamdou"
    )

    User.create!(
        id: -1,
        username: "admin",
        email: "admin@exemple.ex",
        nom: "NOM-ADMIN",
        prenom: "PRENOM-ADMIN",
        role: "Admin",
        password: "admin"
    )


    User.create!(
        username: "manager",
        email: "manager@exemple.ex",
        nom: "NOM-manager",
        prenom: "PRENOM-manager",
        role: "Manager",
        password: "manager"
    )

    User.create!(
        username: "comptable",
        email: "comptable@exemple.ex",
        nom: "NOM-comptable",
        prenom: "PRENOM-comptable",
        role: "Comptable",
        password: "comptable"
    )

    puts "===> Sample date have been set in DB  Users!"

    Categoriedep.create!(
        id: -1,
        name: "AUTRE"
    )
    Categoriedep.create!(
        name: "AVANT SALAIRE"
    )
    Categoriedep.create!(
        name: "E.D.M"
    )
    Categoriedep.create!(
        name: "LOYER"
    )
    Categoriedep.create!(
        name: "TRANSPORT"
    )
    Categoriedep.create!(
        name: "CARBURANT"
    )
    Categoriedep.create!(
        name: "CARTE DE RECHARGE"
    )
    Categoriedep.create!(
        name: "REPARATION DE AUTO/MOTO"
    )

    puts "===> Sample date have been set in DB  Categories depenses!"

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

    (0..100).map do |i|
      Client.create!(
        nom: "Client-#{i}", 
        prenom: "Client-#{i}", 
        address: "address Client-#{i}", 
        email: "Client-#{i}@test.com" )
    end
 puts "===> Sample date have been set in DB  Client!"

 Employe.create!(
        id: -1,
        nom: "No",
        prenom: "No",
        sexe: "m",
        phone: "No",
        address: "No",
        email: "No"
      )
 (0..50).map do |i|
      Employe.create!(
        nom: "EMPLOYEE-#{i}",
        prenom: "EMPLOYEE-#{i}",
        sexe: "m",
        phone: "88 88 88 88",
        address: "RUE 456 PORTE 345",
        email: "exemple-#{i}@exemple_ex"
     )
    end
 puts "===> Sample date have been set in DB  Employées!"

 Coffre.create!(
        paiement: 0,
        font: 0
      )
 puts "===> Sample date have been set in DB  Coffres!"


    Banque.create!(
        id: -1,
        nom: "CAISSE",
        compte: "LOCAL"
    )
    Banque.create!(
        nom: "AUTRE",
        compte: "AUTRE"
    )
    Banque.create!(
        nom: "BDM",
        compte: "xx xx xx xx xx - xx"
    )
    Banque.create!(
        nom: "BHM",
        compte: "xx xx xx xx xx - xx"
    )
    Banque.create!(
        nom: "BNDA",
        compte: "xx xx xx xx xx - xx"
    )
    puts "===> Sample date have been set in DB  Banques!"

    (1..12).map do |i|
      Balance.create!(
          exercice: "#{Time.now.strftime("%Y")}",
          mois: "#{i}",
          achats: 0,
          depenses: 0,
          ventes: 0,
          prestations: 0,
          tva_net: 0
      )
    end
    puts "===> Sample date have been set in DB  balance!"

    Monetaire.create!(
        id: -1,
        money: "XOF - Franc CFA",
        code_money: "CFA",
        valeur: 1
    )
    Monetaire.create!(
        money: "EUR - Euro",
        code_money: "EURO",
        valeur: 655.9570
    )
    Monetaire.create!(
        money: "USD - Dollar des États-Unis",
        code_money: "USD",
        valeur: 564.4144
    )
    Monetaire.create!(
        money: "AED - Dirham des Émirats arabes unis",
        code_money: "AED",
        valeur: 153.6658
    )
    puts "===> Sample date have been set in DB  Money!"

    Optionretoure.create!(
        id: -100,
        name: "Défectueux",
        description: "Qui ne fonction plus..."
    )
    Optionretoure.create!(
        id: 100,
        name: "Echange",
        description: "Qui ne fonction plus..."
    )
    Optionretoure.create!(
        id: 50,
        name: "Réparation",
        description: "Qui ne fonction plus..."
    )
    puts "===> Sample date have been set in DB  Options de retoures!"

    Achat.create!(
        id: -1,
        fournisseur_id: -1,
        fournisseur_libre: 'Initial achat',
    )
    puts "===> Sample date have been set in DB  Options de achats!"

    Vente.create!(
        id: -1,
        client_id: -1,
        boutique_id: -1,
        client_libre: 'Initial vente',
    )
    puts "===> Sample date have been set in DB  Options de ventes!"

    Prestation.create!(
        id: -1,
        client_id: -1,
        client_libre: 'Initial vente',
    )
    puts "===> Sample date have been set in DB  Options de ventes!"

  end
  
end