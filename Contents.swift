/*:
 * * * *
 ## Quem sou eu?
 * * * *
 ![Hi, it's me!](itsMe.png).
 
Olá, eu meu chamo Alcides Junior, tenho 25 anos, sou Técnico em Informática pelo Instituto Federal do Ceará e atualmente curso Engenharia de Computação. Sou baterista e desenvolvedor iOS da Kobe.
 Participei do Apple Developer Academy e fui um dos 350 do mundo inteiro a ser Scholarship pela Apple e participei da WWDC 2019 em San Jose na California.
Amo música, tecnologia e conversar com as pessoas.
 ***
 ## Música
 ***
 Minha introdução na música começou muito cedo: aos 4 anos de idade, porque meu pai é baixista e acabou que ele me influenciou de certa forma e percebeu também que eu tinha grande interesse pela bateria. O tempo foi passando e a coisa foi tomando um belo rumo, cheguei a tocar muito tempo em igreja e conheci muitas pessoas do meio da música. Atualmente, toco profissionalmente aqui em Fortaleza onde faço participações em algumas bandas que tocam Pop, Reggae, Rock e Surf Music e cheguei a participar de um grupo de Jazz e cheguei a tocar algumas vezes em trio de Jazz em cafeterias aqui da minha cidade.
 ***
 ## Tecnologia
 ***
 Meu envolvimento com a tecnologia se deu por meio de um professor que me convidou para o auxiliar em um laboratório de informática educativada da minha escola e eu ficava encatado com aquilo tudo. Usávamos um software linux chamado GComprix, onde tinham várias atividades para crianças que iam desde atividades que ajudavam a desenvolver a coordenação motora, atividades musicais e lições de matemática e até mesmo eletrônica básica. Daí pra frente vi que era aquilo que eu queria para minha vida e decidi investir nisso. Me formei técnico em informática com foco em desenvolvimento de sistemas no IFCE(Instituto Federal do Ceará) e atualmente curso Engenharia de Computação.
 ***
 ## Carreira
 ***
 Quero destacar alguns projetos bem legais que eu pude participar que considero algo que realmente impactaram minha carreira.
 *  Bolsista de Pesquisa Científica - CNPq (Dev. Ruby on Rails)
 *  Co-fundador AJAT Desenvolvimento
 *  Apple Developer Academy

 * * * *
 ## Motivação
 * * * *
 Lembro como se fosse ontem: minha primeira aula de bateria em 1998. Foi uma mistura de sentimentos, muitas euforias! Nesse momento, aprendi meu primeiro ritmo: pop!
 Tocar bateria pode parecer tão difícil porque há muitos componentes: pratos, tambores, pedais etc. A bateria é um instrumento cuja principal habilidade é a coordenação motora!
 Minha motivação para criar este Swift Playground foi mostrar como as pessoas podem tocar bateria sem dificuldade! Basicamente, você precisa saber contar. É isso mesmo: "como contar". O resto resume-se em práticas teóricas e memória muscular.
 Lembre-se sempre, se você pode contar, pode tocar bateria!
 Vou apresentar o básico aqui. Você poderá sentar-se em um kit de bateria e tocar exatamente a mesma coisa que aprendeu e ainda mais fantástico: não precisarei estar aí para mostrar o que fazer. Apenas minhas instruções serão capazes de fazer você tocar!
 
 
 * * * *
 ## Instruções
 * * * *
 - Important:
 Vamos aprender duas variações do ritmo pop. Necessitaremos apenas de três componentes de bateria: Caixa, Bumbo and Prato e, para garantir que você possa ter a mesma experiência e realizar as lições em um kit de bateria real, os componentes estão nas mesmas posições do instrumento real. Eles podem ser controlados pressionando as teclas correspondentes: A, D, K.
 
 ### Teoria
 No quadro-negro, a contagem de 1 a 4 será exibida, que pode ser subdividida dependendo da lição que você escolher. Cada número representa um tempo e, a cada vez, algum componente será apresentado para ser reproduzido: juntos ou separados. Veja a ilustração abaixo:
 
 ![Illustration](model.png).
 
 ###  Lição 1
 Nesta lição, você verá a contagem de 1 a 4. Prato (K) e Bumbo (D) devem ser tocados juntos nos tempos 1 e 3. Prato (K) e Caixa (A) também devem ser tocados juntos no tempo 2 e 4
 
 ###  Lição 2
 Nesta lição, os tempos de 1 a 4 serão subdivididos e adicionaremos a letra "E" entre dois tempos, por exemplo, 1 "E" 2 "E" 3 "E" 4 "E". Prato (K) e Bumbo (D) devem ser tocados juntos nos tempos 1 e 3. Prato (K) e Caixa (A) devem ser tocados juntos nos tempos 2 e 4. No sub-tempo "E", você deve tocar apenas o Prato (K).
 
 
 - Important:
     1. Selecione uma lição no quadro.
     2. Pressione play.
     3. Aguarde a contagem regressiva.
     4. Repita no kit de bateria virtual que será mostrado no quadro-negro. Lembre-se de ser paciente!
 */

import PlaygroundSupport
import SpriteKit
//import GameplayKit

let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 800, height: 600))
let drumset = DrumSet(size: CGSize(width: 800, height: 600))

drumset.scaleMode = .resizeFill
sceneView.presentScene(drumset)
drumset.mountDrumKit()
PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
