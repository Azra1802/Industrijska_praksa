using Pkg;

Pkg.add("JuMP")
Pkg.add("GLPK")

using JuMP,GLPK


# Predavanje 1
# Neko preduzeće plasira na trţište dvije vrste mljevene kafe K1 i K2. Očekivana zarada je 3
# novčane jedinice (skraćeno n.j.) po kilogramu za kafu K1 (tj. 3 n.j./kg), a 2 n.j./kg za kafu K2. Pogon
# za prţenje kafe je na raspolaganju 150 sati sedmično, a pogon za mljevenje kafe 60 sati sedmično.
# Utrošeni sati za prţenje i mljevenje po kilogramu proizvoda dati su u sljedećoj tabeli:
#                  K1            K2
# Prţionica     0.5 h/kg      0.3 h/hg
# Mlin          0.1 h/kg      0.2 h/kg
# Formirati matematski model iz kojeg se moţe odrediti koliko treba proizvesti kafe K1 a koliko kafe K2
# tako da ukupna zarada bude maksimalna.

println("Predavanje zad1")
m=Model(GLPK.Optimizer)
@variable(m,x1>=0)
@variable(m,x2>=0)
@objective(m,Max,3x1+2x2)
@constraint(m,constraint1,0.5x1+0.3x2<=150)
@constraint(m,constraint2,0.1x1+0.2x2<=60)
print(m)

optimize!(m)
termination_status(m)
objective_value(m)
println("Rješenja Pr1: ")
println("x1 = ", value(x1))
println("x2 = ", value(x2))
println("Vrijednost cilja:")
println(objective_value(m))
value(constraint1)
value(constraint2)
dual(constraint1)
dual(constraint2)



# Predavanje 2
# Potrebno je obezbijediti vitaminsku terapiju koja će sadrţavati četiri vrste vitamina V1, V2,
# V3 i V4. Na raspolaganju su dvije vrste vitaminskih sirupa S1 i S2 čije su cijene 40 n.j./g i 30 n.j./g
# respektivno. Vitaminski koktel mora sadrţavati najmanje 0.2 g, 0.3 g, 3 g i 1.2 g vitamina V1, V2, V3 i
# V4 respektivno. Sljedeća tabela pokazuje sastav pojedinih vitamina u obje vrste vitaminskih sirupa:
#      V1     V2     V3     V4
# S1  10%     0%    50%    10%
# S2   0%    10%    30%    20%
# Formirati matematski model iz kojeg se moţe odrediti koliko treba nabaviti sirupa S1 a koliko sirupa
# S2 tako da ukupni trošak bude minimalan.

println("\n Predavanje zad2")
m=Model(GLPK.Optimizer)
@variable(m,x1>=0)
@variable(m,x2>=0)
@objective(m,Min,40x1+30x2)
@constraint(m,constraint1,0.1x1>=0.2)
@constraint(m,constraint2,0.1x2>=0.3)
@constraint(m,constraint3,0.5x1+0.3x2>=3)
@constraint(m,constraint4,0.1x1+0.2x2>=1.2)
print(m)

optimize!(m)
termination_status(m)
objective_value(m)
println("Rješenja Pr2: ")
println("x1 = ", value(x1))
println("x2 = ", value(x2))
println("Vrijednost cilja:")
println(objective_value(m))
value(constraint1)
value(constraint2)
value(constraint3)
value(constraint4)
dual(constraint1)
dual(constraint2)
dual(constraint3)
dual(constraint4)


# Predavanje 3
# Planira se proizvodnja tri tipa detrdţenta D1, D2 i D3. Sa trgovačkom mreţom je dogovorena
# isporuka tačno 100 kg detrdţenta bez obzira na tip. Za uvoz odgovarajućeg repromaterijala planirano
# su sredstva u iznosu od 110 $. Po jednom kilogramu detrdţenta, za proizvodnju detrdţenata D1, D2 i
# D3 treba nabaviti repromaterijala u vrijednosti 2 $, 1.5 $ odnosno 0.5 $. TakoĎer je planirano da se za
# proizvodnju uposle radnici sa angaţmanom od ukupno barem 120 radnih sati, pri čemu je za
# proizvodnju jednog kilograma detrdţenata D1, D2 i D3 potrebno uloţiti respektivno 2 sata, 1 sat
# odnosno 1 sat. Prodajna cijena detrdţenata D1, D2 i D3 po kilogramu respektivno iznosi 10 KM, 5 KM
# odnosno 8 KM. Formirati matematski model iz kojeg se moţe odrediti koliko treba proizvesti svakog
# od tipova detrdţenata da se pri tome ostvari maksimalna moguća zarada.

println("\n Predavanje zad3")
m=Model(GLPK.Optimizer)
@variable(m,x1>=0)
@variable(m,x2>=0)
@variable(m,x3>=0)
@objective(m,Max,2x1-3x2+800)
@constraint(m,constraint1,1.5x1+x2<=60)
@constraint(m,constraint2,x1>=20)
@constraint(m,constraint3,x1+x2<=100)
print(m)

optimize!(m)
termination_status(m)
objective_value(m)
println("Rješenja Pr3: ")
println("x1 = ", value(x1))
println("x2 = ", value(x2))
println("x2 = ", value(x3))
println("Vrijednost cilja:")
println(objective_value(m))
value(constraint1)
value(constraint2)
value(constraint3)
dual(constraint1)
dual(constraint2)
dual(constraint3)





# ZSR 1
# Fabrika može proizvoditi tri proizvoda P1, P2 i P3, pri čemu se koriste tri sirovine S1, S2 i S3. Za
# proizvodnju prvog proizvoda koriste se dvije količinske jedinice prve i tri količinske jedinice druge
# sirovine. Za proizvodnju drugog proizvoda koriste se dvije količinske jedinice prve, tri količinske jedinice
# druge i jedna količinska jedinica treće sirovine. Za proizvodnju trećeg proizvoda potrebno je dvije
# količinske jedinice prve sirovine i jedna količinska jedinica treće sirovine. Dobit od jedne količinske
# jedinice prvog proizvoda je dvije novčane jedinice, od drugog tri novčane jedinice, a od trećeg jedna
# novčana jedinica. Ako su količine sirovina za planski period ograničene na četiri količinske jedinice za
# prvu sirovinu, dvije za drugu i tri za treću, potrebno je napraviti optimalni plan proizvodnje koji de uz
# zadana ograničenja ostvariti najveću novčanu dobit.

println("\n ZSR zad1")
m=Model(GLPK.Optimizer)
@variable(m,x1>=0)
@variable(m,x2>=0)
@variable(m,x3>=0)
@objective(m,Max,2x1+3x2+1x3)
@constraint(m,constraint1,2x1+2x2+2x3<=4)
@constraint(m,constraint2,3x1+3x2<=2)
@constraint(m,constraint3,1x2+1x3<=3)
print(m)

optimize!(m)
termination_status(m)
objective_value(m)
println("Rješenja Zsr1: ")
println("x1 = ", value(x1))
println("x2 = ", value(x2))
println("x2 = ", value(x3))
println("Vrijednost cilja:")
println(objective_value(m))
value(constraint1)
value(constraint2)
value(constraint3)
dual(constraint1)
dual(constraint2)
dual(constraint3)



# ZSR 2
# Fabrika proizvodi dva proizvoda. Za proizvodnju oba proizvoda koristi se jedna sirovina čija količina je
# ograničena na 20 kg u planskom periodu. Za pravljenje svakog kilograma prvog proizvoda potroši se 250
# grama sirovine,a za pravljenje svakog kilograma drugog proizvoda potroši se 750 grama sirovine. Dobit od
# prvog proizvoda je 3 KM po kilogramu, a od drugog 7 KM po kilogramu. Potrebno je napraviti plan
# proizvodnje koji maksimizira dobit, pri čemu je potrebno povesti računa da je količina proizvoda koji se
# mogu plasirati na tržište ograničena. Prvog proizvoda može se prodati maksimalno 10 kg, a drugog 9 kg.

println("\n ZSR zad2")
m=Model(GLPK.Optimizer)
@variable(m,x1>=0)
@variable(m,x2>=0)
@objective(m,Max,3x1+7x2)
@constraint(m,constraint1,0.25x1+0.75x2<=25)
@constraint(m,constraint2,x1<=10)
@constraint(m,constraint3,x2<=9)
print(m)

optimize!(m)
termination_status(m)
objective_value(m)
println("Rješenja Zsr2: ")
println("x1 = ", value(x1))
println("x2 = ", value(x2))
println("Vrijednost cilja:")
println(objective_value(m))
value(constraint1)
value(constraint2)
value(constraint3)
dual(constraint1)
dual(constraint2)
dual(constraint3)





# ZSR 3
# Kompanija za proizvodnju slatkiša proizvodi visokokvalitetne čokoladne proizvode i namjerava pokrenuti
# proizvodnju dva nova slatkiša. Proizvodi se prave u tri različita odjeljka u kojem provode određeno
# vrijeme. Prvi proizvod zahtijeva 1 h proizvodnje u odjeljku 1 i 3 h proizvodnje u odjeljku 3 po jednom
# komadu. Drugi proizvod zahtijeva 1 h proizvodnje u odjeljku 2 i 2 h proizvodnje u odjeljku 3 po jedom
# komadu. Odjeljak 1 ima na raspolaganju 3 slobodna sata, odjeljak 2 ima 6 slobodnih sati i odjeljak 3 ima
# 18 slobodnih sati. Svi proizvedeni novi proizvodi mogu se prodati a cijena prvog iznosi 2 KM, a drugog
# 4 KM po komadu

println("\n ZSR zad3")
m=Model(GLPK.Optimizer)
@variable(m,x1>=0)
@variable(m,x2>=0)
@objective(m,Max,2x1+4x2)
@constraint(m,constraint1,x1<=3)
@constraint(m,constraint2,x2<=6)
@constraint(m,constraint3,3x1+2x2<=18)
print(m)

optimize!(m)
termination_status(m)
objective_value(m)
println("Rješenja Zsr3: ")
println("x1 = ", value(x1))
println("x2 = ", value(x2))
println("Vrijednost cilja:")
println(objective_value(m))
value(constraint1)
value(constraint2)
value(constraint3)
dual(constraint1)
dual(constraint2)
dual(constraint3)



# Brisanje constraint-A i varijabli
delete(m,constraint1)
unregister(m,:constraint1)
delete(m,x1)
unregister(m,:x1)