import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

void showCustomDraggableScrollableSheet(
    {required BuildContext context,
    required Widget child,
    double initialSize = 1,
    double minSize = 1,
    double maxSize = 1,
    Color sheetBackgroundColor = Colors.black,
    double precentOfSheetOnScreen = .8,
    bool isDismissable = false}) {
  double height = MediaQuery.sizeOf(context).height;
  double width = MediaQuery.sizeOf(context).width;
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    isDismissible: isDismissable,
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Container(
        height: height * precentOfSheetOnScreen,
        width: width,
        child: DraggableScrollableSheet(
            initialChildSize: initialSize,
            maxChildSize: maxSize,
            minChildSize: minSize,
            snap: true,
            builder: (context, scrollController) {
              return ListView(
                controller: scrollController,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: sheetBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    padding: EdgeInsets.all(16),
                    width: width,
                    child: child,
                  )
                ],
              );
            }),
      );
    },
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    showCustomDraggableScrollableSheet(
                      initialSize: .4,
                      minSize: .4,
                      maxSize: 1,
                      context: context,
                      child: Text('''Why do you use?
                                                The Lorem ipum filling text is used by graphic designers, programmers and printers with the aim of occupying the spaces of a website, an advertising product or an editorial production whose final text is not yet ready.
                                                
                                                This expedient serves to get an idea of the finished product that will soon be printed or disseminated via digital channels.
                                                
                                                In order to have a result that is more in keeping with the final result, the graphic designers, designers or typographers report the Lorem ipsum text in respect of two fundamental aspects, namely readability and editorial requirements.
                                                
                                                The choice of font and font size with which Lorem ipsum is reproduced answers to specific needs that go beyond the simple and simple filling of spaces dedicated to accepting real texts and allowing to have hands an advertising/publishing product, both web and paper, true to reality.
                                                
                                                Its nonsense allows the eye to focus only on the graphic layout objectively evaluating the stylistic choices of a project, so it is installed on many graphic programs on many software platforms of personal publishing and content management system.
                                                
                                                What are the origins of Lorem Ipsum?
                                                Contrary to what one might think, the Lorem ipsum text, despite being meaningless, has noble origins.
                                                
                                                Objectively composed of unrelated words, Lorem ipsum owes its existence to Marco Tullio Cicerone and to some steps of his De finibus bonorum et malorum (The highest good and the highest evil) written in 45 BC , a classic of Latin literature dating back more than 2000 years ago.
                                                
                                                The discovery was made by Richard McClintock , a professor of Latin at Hampden-Sydney College in Virginia, who faced the impetuous recurrence of the dark word consectetur in the text Lorem ipsum researched its origins to identify them in sections 1.10.32 and 1.10.33 of the aforementioned Cicero's philosophical work.
                                                
                                                The words taken from one of the dialogues contained in the De finibus are therefore the pieces of the most famous nonsensical text in the world.
                                                
                                                A discovery that has given greater importance to the Lorem ipsum which has remained on the crest of the wave since 500, that is when, according to Professor Richard McClintock, its use spread among the printers of the time.
                                                
                                                Of course we know that to make it known to most was a publicity of the Sixties, that of the transferable Letraset character sheets: transparent adhesive sheets on which the Lorem ipsum text was imprinted easily transferable on the editorial products before the advent of the computer.
                                                
                                                Original text of Lorem Ipsum in Latin
                                                «Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur? [33] At vero eos et accusamus et iusto odio dignissimos ducimus, qui blanditiis praesentium voluptatum deleniti atque corrupti, quos dolores et quas molestias excepturi sint, obcaecati cupiditate non provident, similique sunt in culpa, qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio, cumque nihil impedit, quo minus id, quod maxime placeat, facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet, ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.»
                                                
                                                Source: Wikipedia.org
                                                English Translation of Lorem Ipsum
                                                «But I must explain to you how all this mistaken idea of denouncing of a pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?
                                                On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammeled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.»
                                                
                                                What are other versions of lorem ipsum fake text to copy?
                                                There are countless versions of lorem ipsum, the most famous fake text in the world. The versions of lorem ipsum differ in the order in which the Latin words are repeated or how they are cut.
                                                
                                                Loren ipsun dolor sit anet, consectetur adipisci elit
                                                Loren ipsun dolor sit anet, consectetur adipisci elit, sed eiusnod tenpor incidunt ut labore et dolore nagna aliqua. Ut enin ad ninin venian, quis nostrun exercitationen ullan corporis suscipit laboriosan, nisi ut aliquid ex ea connodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cillun dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt nollit anin id est laborun.
                                                
                                                Lorean ipsun dolor sit aneat, conseacteatur adipisci ealit
                                                Lorean ipsun dolor sit aneat, conseacteatur adipisci ealit, sead eaiusnod teanpor incidunt ut laborea eat dolorea nagna aliqua. Ut eanin ad ninin veanian, quis nostrun eaxearcitationean ullan corporis suscipit laboriosan, nisi ut aliquid eax eaa connodi conseaquatur. Quis autea iurea reapreaheandearit in voluptatea vealit eassea cillun dolorea eau fugiat nulla pariatur. eaxceapteaur sint obcaeacat cupiditat non proideant, sunt in culpa qui officia deasearunt nollit anin id east laborun.
                                                
                                                Lorem ips dolor sit amet, consectetur adipisci elit
                                                Lorem ips dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostr exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cill dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est labor.
                                                
                                                Lorem pisum dolor sit amet, consectetur adpisci elit
                                                Lorem pisum dolor sit amet, consectetur adpisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscpit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                                
                                                Lorem ipsum dolor sit amet, consectetur adipisci elit sed diam nonummy nibh euismod tincidunt ut laoreet dolore.
                                                Lorem ipsum dolor sit amet, consectetur adipisci elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore. Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'''),
                    );
                  },
                  icon: Icon(Icons.shop_two_outlined))
            ],
            pinned: true,
            expandedHeight: MediaQuery.sizeOf(context).height * .4,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Lenovo Legion 5 Pro"),
              background: Image.network(
                'https://th.bing.com/th/id/OIP.PE5scdUlaOo5BLCt6i-D4AHaFj?pid=ImgDet&rs=1',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16))),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text('''Why do you use?
                The Lorem ipum filling text is used by graphic designers, programmers and printers with the aim of occupying the spaces of a website, an advertising product or an editorial production whose final text is not yet ready.
                
                This expedient serves to get an idea of the finished product that will soon be printed or disseminated via digital channels.
                
                In order to have a result that is more in keeping with the final result, the graphic designers, designers or typographers report the Lorem ipsum text in respect of two fundamental aspects, namely readability and editorial requirements.
                
                The choice of font and font size with which Lorem ipsum is reproduced answers to specific needs that go beyond the simple and simple filling of spaces dedicated to accepting real texts and allowing to have hands an advertising/publishing product, both web and paper, true to reality.
                
                Its nonsense allows the eye to focus only on the graphic layout objectively evaluating the stylistic choices of a project, so it is installed on many graphic programs on many software platforms of personal publishing and content management system.
                
                What are the origins of Lorem Ipsum?
                Contrary to what one might think, the Lorem ipsum text, despite being meaningless, has noble origins.
                
                Objectively composed of unrelated words, Lorem ipsum owes its existence to Marco Tullio Cicerone and to some steps of his De finibus bonorum et malorum (The highest good and the highest evil) written in 45 BC , a classic of Latin literature dating back more than 2000 years ago.
                
                The discovery was made by Richard McClintock , a professor of Latin at Hampden-Sydney College in Virginia, who faced the impetuous recurrence of the dark word consectetur in the text Lorem ipsum researched its origins to identify them in sections 1.10.32 and 1.10.33 of the aforementioned Cicero's philosophical work.
                
                The words taken from one of the dialogues contained in the De finibus are therefore the pieces of the most famous nonsensical text in the world.
                
                A discovery that has given greater importance to the Lorem ipsum which has remained on the crest of the wave since 500, that is when, according to Professor Richard McClintock, its use spread among the printers of the time.
                
                Of course we know that to make it known to most was a publicity of the Sixties, that of the transferable Letraset character sheets: transparent adhesive sheets on which the Lorem ipsum text was imprinted easily transferable on the editorial products before the advent of the computer.
                
                Original text of Lorem Ipsum in Latin
                «Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur? [33] At vero eos et accusamus et iusto odio dignissimos ducimus, qui blanditiis praesentium voluptatum deleniti atque corrupti, quos dolores et quas molestias excepturi sint, obcaecati cupiditate non provident, similique sunt in culpa, qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio, cumque nihil impedit, quo minus id, quod maxime placeat, facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet, ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.»
                
                Source: Wikipedia.org
                English Translation of Lorem Ipsum
                «But I must explain to you how all this mistaken idea of denouncing of a pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?
                On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammeled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.»
                
                What are other versions of lorem ipsum fake text to copy?
                There are countless versions of lorem ipsum, the most famous fake text in the world. The versions of lorem ipsum differ in the order in which the Latin words are repeated or how they are cut.
                
                Loren ipsun dolor sit anet, consectetur adipisci elit
                Loren ipsun dolor sit anet, consectetur adipisci elit, sed eiusnod tenpor incidunt ut labore et dolore nagna aliqua. Ut enin ad ninin venian, quis nostrun exercitationen ullan corporis suscipit laboriosan, nisi ut aliquid ex ea connodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cillun dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt nollit anin id est laborun.
                
                Lorean ipsun dolor sit aneat, conseacteatur adipisci ealit
                Lorean ipsun dolor sit aneat, conseacteatur adipisci ealit, sead eaiusnod teanpor incidunt ut laborea eat dolorea nagna aliqua. Ut eanin ad ninin veanian, quis nostrun eaxearcitationean ullan corporis suscipit laboriosan, nisi ut aliquid eax eaa connodi conseaquatur. Quis autea iurea reapreaheandearit in voluptatea vealit eassea cillun dolorea eau fugiat nulla pariatur. eaxceapteaur sint obcaeacat cupiditat non proideant, sunt in culpa qui officia deasearunt nollit anin id east laborun.
                
                Lorem ips dolor sit amet, consectetur adipisci elit
                Lorem ips dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostr exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cill dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est labor.
                
                Lorem pisum dolor sit amet, consectetur adpisci elit
                Lorem pisum dolor sit amet, consectetur adpisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscpit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                
                Lorem ipsum dolor sit amet, consectetur adipisci elit sed diam nonummy nibh euismod tincidunt ut laoreet dolore.
                Lorem ipsum dolor sit amet, consectetur adipisci elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore. Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''')
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
/**
 *   const SliverAppBar(
          floating: true,
          backgroundColor: Colors.deepPurple,
          // pinned: true,
          title: Text("AMG Academy"),
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text('Demo'),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('Grid Item $index'),
              );
            },
            childCount: 20,
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('List Item $index'),
              );
            },
          ),
        ),
 */
