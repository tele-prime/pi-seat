'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "269b72ec2b824a6e3ac806203544c8ce",
"version.json": "254f5988b64beeb4ca2915910a529384",
"index.html": "5fff50b914cc6ea6c40010115300b569",
"/": "5fff50b914cc6ea6c40010115300b569",
"main.dart.js": "e40fa2522f312d36e0444acd4dc573fa",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "004521b6fa6cf43e94f67c81db375808",
"assets/NOTICES": "13f59c820da7671ce633ae55fc57e019",
"assets/FontManifest.json": "9a0c7e4f355884836f9ecfcc6c3ddfcf",
"assets/AssetManifest.bin.json": "148462a1d1bb682008a0de3cad6ce018",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/flutter_neumorphic_plus/fonts/NeumorphicIcons.ttf": "32be0c4c86773ba5c9f7791e69964585",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/AssetManifest.bin": "89614232c9df7c44a05e48b8ea3c6efd",
"assets/fonts/MaterialIcons-Regular.otf": "202555a98ead0f81a810a6e345c00646",
"assets/assets/flags/us.png": "f665ab7ea59a093b77a13cfa0be1beec",
"assets/assets/flags/kr.png": "b5592ba5c8cc2c059b82a6589ba55c4a",
"assets/assets/flags/jp.png": "19c3c347073ca2dba3e1c50e78b6177c",
"assets/assets/flags/mm.png": "84f220eaad05294b071a20c3c0be6e24",
"assets/assets/images/i04.png": "dd38dc7c61e10ca531ff5a4f96b5d683",
"assets/assets/images/i05.png": "01eec6feb162ccf8427896a9179174ad",
"assets/assets/images/air_force.png": "4852abf57f5733569a44ac6ca9f21b5c",
"assets/assets/images/arrow_right.png": "a11e3a80a80cb0543c7eb7f0e3e7e661",
"assets/assets/images/arrow_up.png": "cfb7e4cd108275b336cc8fcd5be71bb2",
"assets/assets/images/tv.png": "601590395a73fc7a9892ac0e8c05f846",
"assets/assets/images/i02.png": "ae133e5668ed78853f8eabb83ab1df6f",
"assets/assets/images/i03.png": "5b32465cc6a474fdfc0c3b9fa1b3c669",
"assets/assets/images/i01.png": "de984d8b1ec9d30b42d0d9da73fcc445",
"assets/assets/images/arrow_left.png": "75b24005c1dada81a9e05b6df2f3c063",
"assets/assets/images/eagle.png": "d9ec64c4e2dccc1c24f66698f2f3af3c",
"assets/assets/images/eagle.jpg": "4852abf57f5733569a44ac6ca9f21b5c",
"assets/assets/images/sa.png": "c0f35a0c759d354cd353343648b4c529",
"assets/assets/images/seat_background.png": "536c8feca6842a7b7b1c65d55d529efa",
"assets/assets/images/sb.png": "280f9c90dc9882c7ec57b344a99b6e86",
"assets/assets/images/sf.png": "68b264c295aaa754e5e96720f6f2afa5",
"assets/assets/images/ss.png": "478e8a36b10e908365aeaa589517796e",
"assets/assets/images/light.png": "286ee0502dbc33dc9b0537f1fa3c0e6a",
"assets/assets/images/chair_04.png": "9de4d28916f0267b7d3d266071d730cd",
"assets/assets/images/chair.png": "bbb1f4a837b251363dad1c5f45336294",
"assets/assets/images/chair_05.png": "e8353502b5dd0a7f6ed939b5c3bb43e6",
"assets/assets/images/chair_01.png": "315052ecfeb6d98700e573b53ddaf9fd",
"assets/assets/images/sl.png": "fdabd794ff404cab457eea8c069be777",
"assets/assets/images/chair_02.png": "05c29fea17b7fa9ce2fbf87c1f9fec33",
"assets/assets/images/chair_03.png": "56db08e494e3891a96900e26ccc2afb0",
"assets/assets/images/c1.png": "cd75eba1eeaeaac1270971070ddd56f2",
"assets/assets/images/c0.png": "5dfbabfe78c5f36a1c5a31ae16f01fef",
"assets/assets/images/c2.png": "4e5be6cedcfd3c6aa36527a2535f9425",
"assets/assets/images/c3.png": "8cf8e45d8013bc9830aeaac6bd9b8de1",
"assets/assets/images/arrow_down.png": "d2c7e7cf65bf3af30b243d1fb6fe2212",
"assets/assets/images/c4.png": "e52b0184a58044c6264e643675f70faa",
"assets/assets/images/c5.png": "bb791709deed3b157432abcfbadeec50",
"assets/assets/images/chair_0.png": "a7a0ef3d8d6b59a8cb5ad5c9af825542",
"assets/assets/pdf/seat.pdf": "91999a1661608462bb60780f4f110f47",
"assets/assets/logos/logo_files.png": "9d8783f072f5e86c3000b8ab841efdc8",
"assets/assets/logos/logo_mapswithme.png": "fbac6fc1959a5274b04bdf30590e66df",
"assets/assets/logos/logo_music.png": "4bcb2dd9c56fbda70d315844c3b254bc",
"assets/assets/logos/logo_navigation.png": "ca388c4521ecb6d337d40292670a8039",
"assets/assets/logos/logo_telegram.png": "f4a1603cc4d1257e6e92d126d1312bb1",
"assets/assets/logos/logo_spotify.png": "031b53d2ae6d7768740150ec3db649e5",
"assets/assets/logos/logo_reddit.png": "36fc63bebd1e9f023cc2d2c3714e98ad",
"assets/assets/logos/logo_instagram.png": "870ef55ddd56761e0164273a59c1f6f3",
"assets/assets/logos/logo_vlc.png": "cda0de65639c2cad7052ab214fe3a892",
"assets/assets/logos/logo_movie.png": "3833a39ad217833f12da2e716156008a",
"assets/assets/logos/logo_tablet.png": "c56c768727128ae09f5c52942104bd0b",
"assets/assets/logos/logo_organic.png": "b99acbb60c214a3242b2664d830e5771",
"assets/assets/logos/logo_pinterest.png": "fa89c6b83ad3bf8709a8803640034738",
"assets/assets/logos/logo_zoom.png": "0bc422621c0745c11b9775fa850cee9b",
"assets/assets/logos/logo_snapchat.png": "784755abb795883ef3a4db2dfda86188",
"assets/assets/logos/logo_firefox.png": "5828f38d6c229628322756e7f5a62a52",
"assets/assets/logos/logo_baidu.png": "df49b59cf59098a1532ff909b72a888d",
"assets/assets/logos/logo_skype.png": "650abaae513dcf3f15538f934c1ba862",
"assets/assets/logos/logo_netflix.png": "ac94edab4ded2672eaacaa8fef1877ac",
"assets/assets/logos/logo_facebook.png": "445cb44e1d5e41b6e423ef5f57daf351",
"assets/assets/logos/logo_whatsapp.png": "1980c99a3aba462bc1bfe4728504c052",
"assets/assets/logos/logo_aurora_store.png": "91201c0c4ac7e75c8cddf0e78c128ca5",
"assets/assets/logos/logo_twitter.png": "d2e5ff9007347cce994182b0135477b5",
"assets/assets/icons/icon_entertainment.png": "3de5671b0c269d05d38af855e6f0e50d",
"assets/assets/icons/navigation_icon.png": "db82c99bc4f8200ead84760c6e3b0c42",
"assets/assets/icons/sky_cloud.png": "44de21c8a899f002cf57c8b8f760291d",
"assets/assets/icons/icon_shadow.png": "e5030a235b618d030f4d38bd959cd356",
"assets/assets/icons/tv_icon.png": "7ba3af61159d753068214f585fdde796",
"assets/assets/icons/music_icon.png": "4bcb2dd9c56fbda70d315844c3b254bc",
"assets/assets/icons/movie_icon.png": "3833a39ad217833f12da2e716156008a",
"assets/assets/icons/icon_seat.png": "2e5e970aa1ee5fb88ee9b0a57097acb0",
"assets/assets/fonts/SeatIcon.ttf": "55c2438cca81c96dd67d4f50188618c0",
"assets/assets/fonts/Pyidaungsu.ttf": "36ecc0bdcc82651baf8adf09715fb2bd",
"assets/assets/apps/instagram.png": "ede1570fa4c88ee2226d5fe1d0daef59",
"assets/assets/apps/search.png": "4aa71741c5ce4b3934dad5ef3c80b48f",
"assets/assets/apps/tiktok.png": "8179e687a15725218ebaea4f1a4c7927",
"assets/assets/apps/twitter.png": "901ad373b23e1496cb7b96935fb4d2e9",
"assets/assets/apps/discord.png": "498d67e8220ad4d2b07f433fe229faf9",
"assets/assets/apps/linkedin.png": "a4fd8fa494c08f980d70175109175614",
"assets/assets/apps/youtube.png": "5c12cd8d14f21a748a223c22f5aa02d4",
"assets/assets/apps/pinterest.png": "5ab90ba3d21e32f0b0087eac8ced6a3b",
"assets/assets/apps/whatsapp.png": "419b0f762f23d9c86a45eb1aab26dade",
"assets/assets/apps/facebook.png": "4b4525532e50cc69f2adec2c89e7cc0b",
"assets/assets/lights/table_on.png": "f2ef6174f9d2045ef3a6697cbecb9869",
"assets/assets/lights/light_off.png": "a85d088a891be475648f412369bcc223",
"assets/assets/lights/reading_light.jpg": "4c3ef185eeb0cf8beea743a72e368ecb",
"assets/assets/lights/table_lamp.jpg": "789096d7edff0722e43a4689a8b4eaaa",
"assets/assets/lights/table_off.png": "39d6d49c24e9ab407eb3319a9d45c61f",
"assets/assets/lights/light_on.png": "b4d48054422f00a8718ef48744c8f7d5",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm.js.symbols": "bf4134a57bea8e75e83a6aa0dc2e0856",
"canvaskit/canvaskit.js.symbols": "d8420cb5352d1b19b2b9b7b2223549c1",
"canvaskit/skwasm_heavy.js.symbols": "f25058cedff58ca1837d8fa24b7427c6",
"canvaskit/skwasm.wasm": "66245f3ca4de3fefb3c07ea72eaf8763",
"canvaskit/chromium/canvaskit.js.symbols": "b5820ec8354edca3be08814dc4c923d9",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.wasm": "4e9b9724133569545ec59ac4972bb32a",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.wasm": "3e74fa20f9f4ba797dbcd4fffc1fb008",
"canvaskit/skwasm_heavy.wasm": "f86f974487fbc1dd588f6c9bfa4ee545"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
