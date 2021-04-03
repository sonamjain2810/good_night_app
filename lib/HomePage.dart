import 'dart:async';
import 'dart:io';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:good_night_app/widgets/CustomGradientImageTextWidget.dart';
import 'data/Images.dart';
import 'data/Status.dart';
import 'data/Strings.dart';
import 'widgets/CustomBannerWidget2.dart';
import 'widgets/ImageTextHorizontalWidget2.dart';
import 'widgets/QuotesDesign3.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'StatusList.dart';
import 'data/Gifs.dart';
import 'widgets/CustomFullCard.dart';
import 'package:url_launcher/url_launcher.dart';
import 'QuotesList.dart';
import 'utils/SizeConfig.dart';
import 'AboutUs.dart';
import 'GifsImages.dart';
import 'ImagesList.dart';
import 'MemeGenerator.dart';
import 'MessagesList.dart';
import 'MyDrawer.dart';
import 'NativeAdContainer.dart';
import 'ShayariList.dart';
import 'widgets/CustomTextOnlyWidget.dart';

// Height = 8.96
// Width = 4.14

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// const String testDevice = 'testDeviceId';

class _HomePageState extends State<HomePage> {
  static final facebookAppEvents = FacebookAppEvents();
  String interstitialTag = "";

  // Native Ad Open
  static String _adUnitID = Platform.isAndroid
      ? Strings.androidAdmobNativeId
      : Strings.iosAdmobNativeId;

  final _nativeAdController = NativeAdmobController();
  double _height = 0;

  StreamSubscription _subscription;

  String _authStatus = 'Unknown';


//Native Ad Close
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices:
        Strings.testDevice != null ? <String>[Strings.testDevice] : null,
    //keywords: Keywords.adsKeywords,
    //contentUrl: 'http://foo.com/bar.html',
    childDirected: false,
    nonPersonalizedAds: true,
  );

  InterstitialAd _interstitialAd;

  bool _isInterstitialAdReady = false;

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: Platform.isAndroid
          ? Strings.androidAdmobInterstitialId
          : Strings.iosAdmobInterstitialId,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAdId " + _interstitialAd.adUnitId);
        print("InterstitialAd event $event");
        if (event == MobileAdEvent.closed) {
          _isInterstitialAdReady = false;

          _interstitialAd = createInterstitialAd()..load();

          if (interstitialTag != null) {
            switch (interstitialTag) {
              case "message":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => MessagesList()));
                break;
              case "lang_english":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        MessagesList(type: "1")));
                break;

              case "lang_french":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        MessagesList(type: "2")));
                break;

              case "lang_german":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        MessagesList(type: "3")));
                break;

              case "lang_hindi":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        MessagesList(type: "4")));
                break;

              case "lang_italian":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        MessagesList(type: "5")));
                break;

              case "lang_portuguese":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        MessagesList(type: "6")));
                break;

              case "lang_spanish":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        MessagesList(type: "7")));
                break;

              case "gif":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => GifsImages()));
                break;

              case "image":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => ImagesList()));
                break;

              case "shayari":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => ShayariList()));
                break;

              case "meme":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => MemeGenerator()));
                break;

              case "about":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => AboutUs()));
                break;

              case "status":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => StatusList()));
                break;

              case "quotes":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => QuotesList()));
                break;
              default:
            }
          }
        } else if (event == MobileAdEvent.opened ||
            event == MobileAdEvent.failedToLoad) {
          _isInterstitialAdReady = false;

          if (interstitialTag != null) {
            switch (interstitialTag) {
              case "message":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => MessagesList()));
                break;

              case "lang_english":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        MessagesList(type: "1")));
                break;

              case "lang_french":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        MessagesList(type: "2")));
                break;

              case "lang_german":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        MessagesList(type: "3")));
                break;

              case "lang_hindi":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        MessagesList(type: "4")));
                break;

              case "lang_italian":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        MessagesList(type: "5")));
                break;

              case "lang_portuguese":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        MessagesList(type: "6")));
                break;

              case "lang_spanish":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        MessagesList(type: "7")));
                break;

              case "gif":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => GifsImages()));
                break;

              case "image":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => ImagesList()));
                break;

              case "shayari":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => ShayariList()));
                break;

              case "meme":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => MemeGenerator()));
                break;

              case "about":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => AboutUs()));
                break;

              case "status":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => StatusList()));
                break;

              case "quotes":
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => QuotesList()));
                break;
              default:
            }
          }
        } else if (event == MobileAdEvent.loaded) {
          _isInterstitialAdReady = true;
        } else {
          print("InterstitialAdId " + _interstitialAd.adUnitId);
          print(event.toString());
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(
        appId: Platform.isAndroid
            ? Strings.androidAdmobAppId
            : Strings.iosAdmobAppId);

     initPlugin();

    _interstitialAd?.dispose();
    _interstitialAd = createInterstitialAd()..load();

    //Native Ad
    _subscription = _nativeAdController.stateChanged.listen(_onStateChanged);
    _nativeAdController.setTestDeviceIds([Strings.testDevice]);

    //
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    //Native Ad
    _subscription.cancel();
    _nativeAdController.dispose();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlugin() async {
    TrackingStatus status;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      status = await AppTrackingTransparency.requestTrackingAuthorization();
    } on PlatformException {
      _authStatus = 'Failed to open tracking auth dialog.';
    }

    final uuid = await AppTrackingTransparency.getAdvertisingIdentifier();
    print("UUID: $uuid");

    if (!mounted) {
      return;
    }

    setState(() {
      _authStatus = "$status";
    });
  }

  void _onStateChanged(AdLoadState state) {
    switch (state) {
      case AdLoadState.loading:
        setState(() {
          _height = 0;
        });
        break;

      case AdLoadState.loadCompleted:
        setState(() {
          _height = 36.83 * SizeConfig.heightMultiplier;
        });
        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(SizeConfig.width(8)),
                    child: Center(
                      child: Text("Choose Your Wishes Type",
                          style: Theme.of(context).textTheme.headline1),
                    ),
                  ),

                  Divider(),
                  // Status Start

                  DesignerContainer(
                    isLeft: true,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(SizeConfig.width(8)),
                          child: Text("Best Good Night 'Status'",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(color: Colors.white)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(SizeConfig.width(8)),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: InkWell(
                              child: Row(
                                children: [
                                  CustomGradientImageTextWidget(
                                    size: size,
                                    title: "Status for WhatsApp",
                                    bodyText: Status.status_data[14],
                                    bottomText: "Read",
                                    color1: Colors.pinkAccent,
                                    color2: Colors.pink,
                                    isleft: false,
                                    imageUrl: Gifs.gifs_path[20],
                                    ontap: null,
                                  ),
                                  CustomGradientImageTextWidget(
                                    size: size,
                                    title: "Status for FB",
                                    bodyText: Status.status_data[9],
                                    bottomText: "Read",
                                    color1: Colors.indigoAccent,
                                    color2: Colors.indigo,
                                    isleft: false,
                                    imageUrl: Gifs.gifs_path[31],
                                    ontap: null,
                                  ),
                                  CustomGradientImageTextWidget(
                                    size: size,
                                    title: "Best Status",
                                    bodyText: Status.status_data[3],
                                    bottomText: "Read",
                                    color1: Colors.deepPurple,
                                    color2: Colors.deepPurpleAccent,
                                    isleft: false,
                                    imageUrl: Gifs.gifs_path[33],
                                    ontap: null,
                                  ),
                                ],
                              ),
                              onTap: () {
                                print("Status Clicked");
                                interstitialTag = "status";
                                facebookAppEvents.logEvent(
                                  name: "Status List",
                                  parameters: {
                                    'button_id': 'Status_button',
                                  },
                                );
                                _isInterstitialAdReady == true
                                    ? _interstitialAd?.show()
                                    : Navigator.of(context).push(
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                StatusList()));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Status End
                  Divider(),
                  // Messages Start
                  Column(
                    children: [
                      DesignerContainer(
                        isLeft: true,
                        child: Padding(
                          padding: EdgeInsets.all(SizeConfig.width(8)),
                          child: Center(
                            child: Text("Select Wishes & Messages Language:",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(color: Colors.white)),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.all(SizeConfig.width(8.0)),
                          child: Row(
                            children: [
                              CustomTextOnlyWidget(
                                size: size,
                                borderColor: Colors.blue[900],
                                headingText: "English",
                                text:
                                    "No need to be upset or feel lonely tonight. Feel the calmness of this night with all your heart. Relax and have a tight sleep. Good night.",
                                color: Colors.amberAccent,
                                ontap: () {
                                  print("Language English Clicked");
                                  interstitialTag = "lang_english";
                                  facebookAppEvents.logEvent(
                                    name: "Message List",
                                    parameters: {
                                      'button_id': 'lang_english_button',
                                    },
                                  );
                                  _isInterstitialAdReady == true
                                      ? _interstitialAd?.show()
                                      : Navigator.of(context).push(
                                          new MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  MessagesList(type: "1")));
                                },
                              ),
                              CustomTextOnlyWidget(
                                size: size,
                                borderColor: Colors.blue[900],
                                headingText: "हिन्दी",
                                text:
                                    "ऐसा लगता है कुछ होने जा रहा है\nकोई मीठे सपनो में खोने जा रहा है\nधीमी कर दे अपनी रोशनी ऐ चाँद\nमेरा कोई अपना सोने जा रहा है\nगुड नाईट\nशुभ रात्रि!",
                                color: Colors.amberAccent,
                                ontap: () {
                                  print("Hindi Clicked");
                                  interstitialTag = "lang_hindi";
                                  facebookAppEvents.logEvent(
                                    name: "Message List",
                                    parameters: {
                                      'button_id': 'lang_hindi_button',
                                    },
                                  );
                                  _isInterstitialAdReady == true
                                      ? _interstitialAd?.show()
                                      : Navigator.of(context).push(
                                          new MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  MessagesList(type: "4")));
                                },
                              ),
                              CustomTextOnlyWidget(
                                size: size,
                                borderColor: Colors.blue[900],
                                headingText: "Deutsche",
                                text:
                                    "Ich sende dir eine Wolke, die dich zudeckt, einen Stern,der Dir die Nacht erhellt, den Mond der Dich bewacht süsse Träume und Gute Nacht!",
                                color: Colors.amberAccent,
                                ontap: () {
                                  print("German Clicked");
                                  interstitialTag = "lang_german";
                                  facebookAppEvents.logEvent(
                                    name: "Message List",
                                    parameters: {
                                      'button_id': 'lang_german_button',
                                    },
                                  );
                                  _isInterstitialAdReady == true
                                      ? _interstitialAd?.show()
                                      : Navigator.of(context).push(
                                          new MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  MessagesList(type: "3")));
                                },
                              ),
                              CustomTextOnlyWidget(
                                  size: size,
                                  borderColor: Colors.blue[900],
                                  headingText: "français",
                                  text:
                                      "Quand la nuit se pose, quand les choses se reposent, quand les paupières se closent, comme une rose qui se replie, j’aime ce moment où je te dis avec amour BONNE NUIT",
                                  color: Colors.amberAccent,
                                  ontap: () {
                                    print("français Clicked");
                                    interstitialTag = "lang_french";
                                    facebookAppEvents.logEvent(
                                      name: "Message List",
                                      parameters: {
                                        'button_id': 'lang_french_button',
                                      },
                                    );
                                    _isInterstitialAdReady == true
                                        ? _interstitialAd?.show()
                                        : Navigator.of(context).push(
                                            new MaterialPageRoute(
                                                builder: (BuildContext
                                                        context) =>
                                                    MessagesList(type: "2")));
                                  }),
                              CustomTextOnlyWidget(
                                size: size,
                                borderColor: Colors.blue[900],
                                headingText: "Italiano",
                                text:
                                    "I miracoli sono dappertutto…. i miracoli sono altruismo, affetto, amore… i miracoli sono piccole gioie di ogni giorno, quelle chiuse nei gesti quotidiani… Chiudi gli occhi e pensa che anche tu sei un meraviglioso Miracolo! Buonanotte",
                                color: Colors.amberAccent,
                                ontap: () {
                                  print("Italian Clicked");
                                  interstitialTag = "lang_italian";
                                  facebookAppEvents.logEvent(
                                    name: "Message List",
                                    parameters: {
                                      'button_id': 'lang_italian_button',
                                    },
                                  );
                                  _isInterstitialAdReady == true
                                      ? _interstitialAd?.show()
                                      : Navigator.of(context).push(
                                          new MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  MessagesList(type: "5")));
                                },
                              ),
                              CustomTextOnlyWidget(
                                size: size,
                                borderColor: Colors.blue[900],
                                headingText: "Português",
                                text:
                                    "Que Deus dê descanso para o teu corpo e alívio para a tua alma, para que você possa enfrentar o amanhã com um sorriso no rosto.\n Boa noite!",
                                color: Colors.amberAccent,
                                ontap: () {
                                  print("Portuguese Clicked");
                                  interstitialTag = "lang_portuguese";
                                  facebookAppEvents.logEvent(
                                    name: "Message List",
                                    parameters: {
                                      'button_id': 'lang_portuguese_button',
                                    },
                                  );
                                  _isInterstitialAdReady == true
                                      ? _interstitialAd?.show()
                                      : Navigator.of(context).push(
                                          new MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  MessagesList(type: "6")));
                                },
                              ),
                              CustomTextOnlyWidget(
                                size: size,
                                borderColor: Colors.blue[900],
                                headingText: "Español",
                                text:
                                    "Recuerda que los sueños siempre se hacen realidad, si lo dudas, mírate eres mi sueño hecho realidad. Que descanses y buenas noches amor.",
                                color: Colors.amberAccent,
                                ontap: () {
                                  print("For All Clicked");
                                  interstitialTag = "lang_spanish";
                                  facebookAppEvents.logEvent(
                                    name: "Message List",
                                    parameters: {
                                      'button_id': 'lang_spanish_button',
                                    },
                                  );
                                  _isInterstitialAdReady == true
                                      ? _interstitialAd?.show()
                                      : Navigator.of(context).push(
                                          new MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  MessagesList(type: "7")));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Messages End

                  Divider(),

                  //Native Ad
                  DesignerContainer(
                    isLeft: false,
                    child: NativeAdContainer(
                      height: _height,
                      adUnitID: _adUnitID,
                      nativeAdController: _nativeAdController,
                      numberAds: 4,
                    ),
                  ),

                  Divider(),
                  //Gifs Start
                  DesignerContainer(
                    isLeft: false,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(SizeConfig.width(8)),
                          child: Text("Explore Gifs",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(color: Colors.white)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(SizeConfig.width(8)),
                          child: InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                ImageTextHorizontalWidget2(
                                    context: context,
                                    imageUrl: Gifs.gifs_path[14],
                                    title: "Good Night Wishes\nGifs Collection",
                                    subTitle: "50+ Images"),
                              ],
                            ),
                            onTap: () {
                              print("Gifs Clicked");
                              interstitialTag = "gif";
                              facebookAppEvents.logEvent(
                                name: "GIF List",
                                parameters: {
                                  'button_id': 'gif_button',
                                },
                              );
                              _isInterstitialAdReady == true
                                  ? _interstitialAd?.show()
                                  : Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ShayariList()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Gifs End
                  Divider(),

                  // Quotes start
                  Column(
                    children: [
                      DesignerContainer(
                        isLeft: true,
                        child: Padding(
                          padding: EdgeInsets.all(SizeConfig.width(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Good Night Quotes",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .copyWith(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(SizeConfig.width(8)),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                QuotesDesign3(
                                    size: size,
                                    color: Colors.cyan,
                                    bodyText:
                                        "“Good night, good night! Parting is such sweet sorrow that, I shall say good night till it be morrow.”",
                                    footerText: " ~ William Shakespeare",
                                    curvedBorder: true,
                                    ontap: null),
                                SizedBox(width: SizeConfig.width(8)),
                                QuotesDesign3(
                                    size: size,
                                    color: Colors.purpleAccent,
                                    bodyText:
                                        "“May I kiss you then? On this miserable paper? I might as well open the window and kiss the night air.” – Franz Kafka",
                                    footerText: " ~ Franz Kafka",
                                    curvedBorder: true,
                                    ontap: null),
                                SizedBox(width: SizeConfig.width(8)),
                                QuotesDesign3(
                                    size: size,
                                    color: Colors.amberAccent,
                                    borderColor: Colors.redAccent,
                                    bodyText:
                                        "“Night is always darker before the dawn and life is the same, the hard times will pass, every thing will get better and sun will shine brighter then ever.”",
                                    footerText: " ~ Ernest Hemingway",
                                    curvedBorder: true,
                                    ontap: null),
                              ],
                            ),
                            onTap: () {
                              print("Quotes Clicked");
                              interstitialTag = "quotes";
                              facebookAppEvents.logEvent(
                                name: "Quotes List",
                                parameters: {
                                  'button_id': 'Quotes_button',
                                },
                              );
                              _isInterstitialAdReady == true
                                  ? _interstitialAd?.show()
                                  : Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              QuotesList()));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Quotes end

                  Divider(),

                  //Native Ad
                  DesignerContainer(
                    isLeft: true,
                    child: NativeAdContainer(
                      height: _height,
                      adUnitID: _adUnitID,
                      nativeAdController: _nativeAdController,
                      numberAds: 4,
                    ),
                  ),

                  Divider(),
                  // Shayari Start
                  DesignerContainer(
                    isLeft: false,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(SizeConfig.width(8)),
                          child: Text("Good Night Shayari",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(color: Colors.white)),
                        ),
                        Padding(
                            padding: EdgeInsets.all(SizeConfig.width(8)),
                            child: CustomBannerWidget2(
                              size: size,
                              imagePath: Images.images_path[1],
                              topText: "Best Latest Shayari",
                              middleText:
                                  "हर रात आपकी चारों तरफ उजाला हो,\nऔर हर रात आपसे कोई गुड नाईट कहने वाला हो।",
                              bottomText: "in Hindi Font",
                              buttonText: "Explore Now",
                              ontap: () {
                                print("Shayari Clicked");
                                interstitialTag = "shayari";
                                facebookAppEvents.logEvent(
                                  name: "Shayari List",
                                  parameters: {
                                    'button_id': 'Shayari_button',
                                  },
                                );
                                _isInterstitialAdReady == true
                                    ? _interstitialAd?.show()
                                    : Navigator.of(context).push(
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                ShayariList()));
                              },
                            )),
                      ],
                    ),
                  ),
                  // Shayari End

                  Divider(),

                  //Image Start

                  Column(
                    children: [
                      DesignerContainer(
                        isLeft: true,
                        child: Padding(
                          padding: EdgeInsets.all(SizeConfig.width(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Explore Images",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .copyWith(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(SizeConfig.width(8)),
                        child: InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              ImageTextHorizontalWidget2(
                                context: context,
                                imageUrl: Images.images_path[8],
                                title: "Good Night Wishes\nImages Collection",
                                subTitle: "50+ Images",
                              ),
                            ],
                          ),
                          onTap: () {
                            print("Images Clicked");
                            interstitialTag = "image";
                            facebookAppEvents.logEvent(
                              name: "Image List",
                              parameters: {
                                'button_id': 'Image_button',
                              },
                            );

                            _isInterstitialAdReady == true
                                ? _interstitialAd?.show()
                                : Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ImagesList()));
                          },
                        ),
                      ),
                    ],
                  ),
                  // Image End

                  Divider(),
                  //Native Ad
                  DesignerContainer(
                    isLeft: false,
                    child: NativeAdContainer(
                      height: _height,
                      adUnitID: _adUnitID,
                      nativeAdController: _nativeAdController,
                      numberAds: 4,
                    ),
                  ),

                  Divider(),

                  // Wish Creator Start
                  Column(
                    children: [
                      DesignerContainer(
                        isLeft: false,
                        child: Padding(
                          padding: EdgeInsets.all(SizeConfig.width(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Create Good Night Meme & e-Card ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .copyWith(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(SizeConfig.width(8)),
                        child: CustomBannerWidget2(
                          size: MediaQuery.of(context).size,
                          imagePath: Gifs.gifs_path[7],
                          buttonText: "Try It",
                          topText: "Send Good Night Card",
                          middleText: "Create It Now.",
                          bottomText: "Share It With Your Friends",
                          ontap: () {
                            print("Meme Clicked");
                            interstitialTag = "meme";
                            facebookAppEvents.logEvent(
                              name: "Meme Generator",
                              parameters: {
                                'button_id': 'meme_button',
                              },
                            );
                            _isInterstitialAdReady == true
                                ? _interstitialAd?.show()
                                : Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            MemeGenerator()));
                          },
                        ),
                      ),
                    ],
                  ),
                  // Wish Creator End
                  Divider(),
                  //Native Ad
                  DesignerContainer(
                    isLeft: true,
                    child: NativeAdContainer(
                      height: _height,
                      adUnitID: _adUnitID,
                      nativeAdController: _nativeAdController,
                      numberAds: 4,
                    ),
                  ),

                  Divider(),

                  DesignerContainer(
                    isLeft: false,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(SizeConfig.width(8)),
                          child: Text("Play Game \"Sell Rakhi\"",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(color: Colors.white)),
                        ),
                        CustomFullCard(
                          size: MediaQuery.of(context).size,
                          assetsImagePath: "assets/rakhi_game.jpeg",
                          ontap: () {
                            if (Platform.isAndroid) {
                              // Android-specific code
                              print("More Button Clicked");
                              launch(
                                  "https://play.google.com/store/apps/developer?id=Festival+Messages+SMS");
                            } else if (Platform.isIOS) {
                              // iOS-specific code
                              print("More Button Clicked");
                              launch(
                                  "https://apps.apple.com/us/app/-/id1434054710");

                              facebookAppEvents.logEvent(
                                name: "Play Rakshabandhan Game",
                                parameters: {
                                  'clicked_on_play_rakshabandhan_game': 'Yes',
                                },
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),

                  Divider(),

                  Padding(
                    padding: EdgeInsets.all(SizeConfig.width(8)),
                    child: Text("Apps From Developer",
                        style: Theme.of(context).textTheme.headline1),
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.all(SizeConfig.width(8)),
                      child: Row(
                        children: <Widget>[
                          //Column1
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              AppStoreAppsItemWidget1(
                                  imageUrl:
                                      "https://is1-ssl.mzstatic.com/image/thumb/Purple117/v4/8f/e7/b5/8fe7b5bc-03eb-808c-2b9e-fc2c12112a45/mzl.jivuavtz.png/292x0w.jpg",
                                  appTitle: "Good Morning Images & Messages",
                                  appUrl:
                                      "https://apps.apple.com/us/app/good-morning-images-messages-to-wish-greet-gm/id1232993917"),
                              Divider(),
                              AppStoreAppsItemWidget1(
                                  imageUrl:
                                      "https://is4-ssl.mzstatic.com/image/thumb/Purple114/v4/44/e0/fd/44e0fdb5-667b-5468-7b2f-53638cba539e/AppIcon-1x_U007emarketing-0-7-0-0-85-220.png/292x0w.jpg",
                                  appTitle: "Birthday Status Wishes Quotes",
                                  appUrl:
                                      "https://apps.apple.com/us/app/birthday-status-wishes-quotes/id1522542709"),
                              Divider(),
                              AppStoreAppsItemWidget1(
                                  imageUrl:
                                      "https://is4-ssl.mzstatic.com/image/thumb/Purple114/v4/1a/58/a4/1a58a480-a0ae-1940-2cf3-38524430f66b/AppIcon-0-1x_U007emarketing-0-0-GLES2_U002c0-512MB-sRGB-0-0-0-85-220-0-0-0-7.png/292x0w.jpg",
                                  appTitle: "Astrology Horoscope Lal Kitab",
                                  appUrl:
                                      "https://apps.apple.com/us/app/astrology-horoscope-lal-kitab/id1448343526"),
                            ],
                          ),
                          SizedBox(width: SizeConfig.width(3)),
                          //Column2
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              AppStoreAppsItemWidget1(
                                  imageUrl:
                                      "https://is2-ssl.mzstatic.com/image/thumb/Purple124/v4/e9/96/64/e99664d3-1083-5fac-6a0c-61718ee209fd/AppIcon-0-1x_U007emarketing-0-0-GLES2_U002c0-512MB-sRGB-0-0-0-85-220-0-0-0-7.png/292x0w.jpg",
                                  appTitle: "Weight Loss My Diet Coach Tips",
                                  appUrl:
                                      "https://apps.apple.com/us/app/weight-loss-my-diet-coach-tips/id1448343218"),
                              Divider(),
                              AppStoreAppsItemWidget1(
                                  imageUrl:
                                      "https://is2-ssl.mzstatic.com/image/thumb/Purple127/v4/5f/7c/45/5f7c45c7-fb75-ea39-feaa-a698b0e4b09e/pr_source.jpg/292x0w.jpg",
                                  appTitle: "English Speaking Course Grammar",
                                  appUrl:
                                      "https://apps.apple.com/us/app/english-speaking-course-learn-grammar-vocabulary/id1233093288"),
                              Divider(),
                              AppStoreAppsItemWidget1(
                                  imageUrl:
                                      "https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/50/ad/82/50ad82d9-0d82-5007-fcdd-cc47c439bfd0/AppIcon-0-1x_U007emarketing-0-85-220-10.png/292x0w.jpg",
                                  appTitle: "English Hindi Language Diction",
                                  appUrl:
                                      "https://apps.apple.com/us/app/english-hindi-language-diction/id1441243874"),
                            ],
                          ),
                          SizedBox(width: SizeConfig.width(3)),
                          //Column3

                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              AppStoreAppsItemWidget1(
                                  imageUrl:
                                      "https://is3-ssl.mzstatic.com/image/thumb/Purple118/v4/17/f5/0c/17f50c4d-431b-72c6-b9f4-d1706da59394/AppIcon-0-1x_U007emarketing-0-0-85-220-7.png/292x0w.jpg",
                                  appTitle: "Celebrate Happy New Year 2019",
                                  appUrl:
                                      "https://apps.apple.com/us/app/celebrate-happy-new-year-2019/id1447735210"),
                              Divider(),
                              AppStoreAppsItemWidget1(
                                  imageUrl:
                                      "https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/79/1e/61/791e61de-500c-6c97-3947-8abbc6b887e3/AppIcon-0-1x_U007emarketing-0-0-GLES2_U002c0-512MB-sRGB-0-0-0-85-220-0-0-0-7.png/292x0w.jpg",
                                  appTitle: "Bangladesh Passport Visa Biman",
                                  appUrl:
                                      "https://apps.apple.com/us/app/bangladesh-passport-visa-biman/id1443074171"),
                              Divider(),
                              AppStoreAppsItemWidget1(
                                  imageUrl:
                                      "https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/dd/34/c3/dd34c3e8-5c9f-51aa-a3eb-3a203f5fd49b/AppIcon-0-1x_U007emarketing-0-0-GLES2_U002c0-512MB-sRGB-0-0-0-85-220-0-0-0-10.png/292x0w.jpg",
                                  appTitle: "Complete Spoken English Course",
                                  appUrl:
                                      "https://apps.apple.com/us/app/complete-spoken-english-course/id1440118617"),
                            ],
                          ),
                          SizedBox(width: SizeConfig.width(3)),

                          //Column4
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              AppStoreAppsItemWidget1(
                                  imageUrl:
                                      "https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/bd/00/ee/bd00ee3b-43af-6b07-62a6-28c68373a8b5/AppIcon-1x_U007emarketing-85-220-0-9.png/292x0w.jpg",
                                  appTitle: "Happy Anniversary Greeting SMS",
                                  appUrl:
                                      "https://apps.apple.com/us/app/happy-anniversary-greeting-sms/id1435157874"),
                              Divider(),
                              AppStoreAppsItemWidget1(
                                  imageUrl:
                                      "https://is4-ssl.mzstatic.com/image/thumb/Purple91/v4/f0/84/d7/f084d764-79a8-f6d1-3778-1cb27fabb8bd/pr_source.png/292x0w.jpg",
                                  appTitle: "Egg Recipes 100+ Recipes",
                                  appUrl:
                                      "https://apps.apple.com/us/app/egg-recipes-100-recipes-collection-for-eggetarian/id1232736881"),
                              Divider(),
                              AppStoreAppsItemWidget1(
                                  imageUrl:
                                      "https://is1-ssl.mzstatic.com/image/thumb/Purple114/v4/0f/d6/f4/0fd6f410-9664-94a5-123f-38d787bf28c6/AppIcon-1x_U007emarketing-0-7-0-0-85-220.png/292x0w.jpg",
                                  appTitle: "Rakshabandhan Images Greetings",
                                  appUrl:
                                      "https://apps.apple.com/us/app/rakshabandhan-images-greetings/id1523619788"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

class QuotesDesign1 extends StatelessWidget {
  const QuotesDesign1({
    Key key,
    @required this.size,
    @required this.color,
    @required this.bodyText,
    @required this.footerText,
    this.ontap,
  }) : super(key: key);

  final Color color;
  final String bodyText, footerText;
  final Size size;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          width: size.width - SizeConfig.width(16),
          height: size.width / 2,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(SizeConfig.height(20)),
              topRight: Radius.circular(SizeConfig.height(20)),
            ),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 0), blurRadius: 4, color: Colors.grey),
            ],
          ),
          child: Stack(
            children: [
              Icon(Icons.format_quote,
                  color: Theme.of(context).primaryIconTheme.color),
              Positioned(
                top: 20,
                width: size.width - SizeConfig.width(16),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.width(8)),
                    child: Text(
                      bodyText,
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.width(8)),
                    child: Text(
                      footerText,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Theme.of(context).primaryIconTheme.color,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: ontap);
  }
}

class DesignerContainer extends StatelessWidget {
  const DesignerContainer({
    Key key,
    @required this.child,
    @required this.isLeft,
  }) : super(key: key);

  final Widget child;
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isLeft
          ? BoxDecoration(
              color: Theme.of(context).colorScheme.primaryVariant,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(SizeConfig.height(20)),
              ),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0), blurRadius: 4, color: Colors.grey),
              ],
            )
          : BoxDecoration(
              color: Theme.of(context).colorScheme.primaryVariant,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(SizeConfig.height(20)),
              ),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0), blurRadius: 4, color: Colors.grey),
              ],
            ),
      child: child,
    );
  }
}

class TopNBottomBackground extends StatelessWidget {
  const TopNBottomBackground({
    Key key,
    @required this.size,
    this.color,
    this.isTop,
  }) : super(key: key);

  final Size size;
  final Color color;
  final bool isTop;
  @override
  Widget build(BuildContext context) {
    return isTop
        ? Positioned(
            top: 0,
            left: 0,
            width: size.width,
            height: size.height * 0.15,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight:
                    Radius.circular(SizeConfig.height(size.height / 2)),
                bottomLeft: Radius.circular(SizeConfig.height(size.height / 2)),
              ),
              child: ColoredBox(color: color),
            ))
        : Positioned(
            left: 0,
            bottom: 0,
            width: size.width,
            height: size.height * 0.15,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(SizeConfig.height(size.height / 2)),
                topLeft: Radius.circular(SizeConfig.height(size.height / 2)),
              ),
              child: ColoredBox(color: color),
            ));
  }
}

class CustomHeader1 extends StatelessWidget {
  const CustomHeader1({
    Key key,
    this.headerText,
    this.imagePath,
    this.descriptionText,
  }) : super(key: key);

  final String headerText, imagePath, descriptionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 3 * SizeConfig.widthMultiplier,
        bottom: 10 * SizeConfig.widthMultiplier,
        left: 10 * SizeConfig.widthMultiplier,
        right: 10 * SizeConfig.widthMultiplier,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryVariant,
        borderRadius: BorderRadius.only(
          //30
          bottomRight: Radius.circular(MediaQuery.of(context).size.width),
        ),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    headerText,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    width: 1.93 * SizeConfig.widthMultiplier,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(imagePath),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 2 * SizeConfig.heightMultiplier,
          ),
          Text(
            descriptionText,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class AppStoreAppsItemWidget1 extends StatelessWidget {
  const AppStoreAppsItemWidget1({
    Key key,
    this.imageUrl,
    this.appUrl,
    this.appTitle,
  }) : super(key: key);

  final String imageUrl, appUrl, appTitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius:
                BorderRadius.all(Radius.circular(SizeConfig.width(16))),
            child: Padding(
              padding: EdgeInsets.only(right: SizeConfig.width(3)),
              child: CachedNetworkImage(
                height: SizeConfig.height(80),
                width: SizeConfig.width(80),
                imageUrl: imageUrl,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fadeOutDuration: const Duration(seconds: 1),
                fadeInDuration: const Duration(seconds: 3),
              ),
            ),
          ),
          Text(
            appTitle,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      onTap: () {
        launch(appUrl);
      },
    );
  }
}