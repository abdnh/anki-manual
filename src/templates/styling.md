# التنسيق و HTML {#styling--html}

<!-- toc -->

## تنسيق البطاقات {#card-styling}

بإمكانك مشاهدة فيديو عن [تنسيق البطاقات](http://www.youtube.com/watch?v=F1j1Zx0mXME&yt:cc=on)
في يوتيوب. يظهر الفيديو واجهة أنكي 2.0، لكن المفاهيم هي نفسها تقريبًا.

بين القالبين الأمامي والخلفي هناك قسم تنسيق البطاقة.
تستطيع تغيير لون خلفية البطاقة، الخط الافتراضي، محاذاة الخط، وما إلى ذلك من خلال هذا القسم.

الخيارات الأساسية المتوفرة هي:

**font-family**\
اسم الخط الذي تريد استخدامه في البطاقة. إذا كان هناك فراغات في اسم الخط مثل "MS Unicode"،
فعليك أن تحيط الاسم بأقواس مثل المستخدمة في هذه الجملة. من الممكن أيضًا استخدام
عدة خطوط في البطاقة نفسها؛ تابع القراءة لمزيد من المعلومات.

**font-size**\
حجم الخط بوحدة البيكسل. لا تنس إبقاء "px" في آخر الحجم عند تغييره.

**text-align**\
محاذاة النص إلى الوسط، أو اليسار، أو اليمين.

**color**\
لون النص. ستعمل أسماء ألوان بسيطة مثل 'blue'، أو 'lightyellow'، وما إلى ذلك.
كما بإمكانك استخدام رموز ألوان HTML لاختيار ألوان اعتباطية.
انظر [هذا الموقع](https://htmlcolorcodes.com/) لمزيد من المعلومات.

**background-color**\
لون خلفية البطاقة.

يمكن وضع أي CSS في قسم التنسيق - قد يرغب المستخدمون المتقدمون في فعل أشياء مثل
إضافة صورة خلفية أو خلفية بألوان متدرجة مثلًا. إذا كنت تتساءل
كيف تحصل على صيغة ما، ابحث في الويب عن معلومات حول كيفية فعل ذلك في CSS،
حيث هناك كمية هائلة من الوثائق.

تشترك كل البطاقات بمعلومات التنسيق، ما يعني أنه عندما تجري تعديلًا
فإنه سيؤثر على كل بطاقات نوع الملحوظة ذاك. لكن من الممكن أيضًا تطبيق تنسيقات
خاصة ببطاقة محددة. يستخدم المثال التالي خلفية صفراء في كل البطاقات ما عدا الأولى:

<div dir="ltr">

```css
.card {
  background-color: yellow;
}
.card1 {
  background-color: blue;
}
```

</div>

## تغيير حجم الصور {#image-resizing}

يقلص أنكي الصور لتلائم الشاشة بشكل افتراضي. تستطيع تغيير هذا بإضافة التالي إلى
أسفل قسم التنسيق (خارج قسم <span dir="ltr"> `.card { ... }`</span> الافتراضي):

<div dir="ltr">

```css
img {
  max-width: none;
  max-height: none;
}
```

</div>

أحيانًا يواجه أنكيدرويد مشاكل عند [تغيير جحم الصور لتلائم الشاشة](https://github.com/ankidroid/Anki-Android/issues/3612).
ضبط أبعاد الصورة القصوى باستخدام CSS يجب أن يصلح هذا، لكن ليس في أنكيدرويد 2.9 على ما يبدو.
يمكن إصلاح هذا بإضافة <span dir="ltr"> `!important`</span> لكل أمر تنسيق كالتالي:

<div dir="ltr">

```css
img {
  max-width: 300px !important;
  max-height: 300px !important;
}
```

</div>

إذا أدرت تغيير تنسيق الصور ووجدت أن النجمة التي تظهر على البطاقات المعلّمة تأثرت بذلك
(أصبحت كبيرة جدًا مثلًا)، فبإمكانك تنسيقها باستخدام التالي:

<div dir="ltr">

```css
img#star {
  ...;
}
```

</div>

تستطيع تصفح تنسيق البطاقات بشكل تفاعلي باستخدام متصفح كروم:

<https://addon-docs.ankiweb.net/porting2.0.html#webview-changes>

## تنسيق الحقول {#field-styling}

ينطبق التنسيق الافتراضي على البطاقة كاملة. كما تستطيع جعل بعض الحقول أو قسم من البطاقة
يستخدم خطًا، أو لونًا مختلفًا، وما إلى ذلك. هذا مهم خصيصًا حين دراسة اللغات الأجنبية، حيث
لا يقدر أنكي أحيانًا على إظهار الحروف بشكل صحيح إلا إذا اُختير الخط المناسب.

لنقل أن لديك حقلًا باسم «عبارة»، وتريد عرضه بخط أو إس إكس التايلندي “Ayuthaya”.
لنفرض أن قالبك يحوي التالي:

    ما {{عبارة}}؟

    {{ملاحظات}}

علينا إحاطة النص الذي نريد تنسيقه ببعض الHTML. سنضع التالي قبل النص:

<div dir="ltr">

    <div class=mystyle1>

</div>

والتالي بعده:

<div dir="ltr">

    </div>

</div>

بإحاطة النص هكذا، فإننا نخبر أنكي بتنسيق النص المحاط بتنسيق مخصص
سننشئه لاحقًا يدعى “mystyle1”،

إذا أدرنا أن تستخدم عبارة «ما ...؟» كاملة الخط التايلندي، فسنستخدم:

<div dir="ltr">

    <div class=mystyle1>ما {{عبارة}}؟</div>

    {{ملاحظات}}

</div>

وإذا أدرنا استخدام الخط لحقل العبارة فقط، فسنستخدم:

<div dir="ltr">

    ما <div class=mystyle1>{{عبارة}}</div>؟

    {{ملاحظات}}

</div>

بعد تعديل القالب، علينا الانتقال إلى قسم التنسيق بين القوالب. يجب أن يبدو كالتالي
قبل تعديله:

<div dir="ltr">

```css
.card {
  font-family: arial;
  font-size: 20px;
  text-align: center;
  color: black;
  background-color: white;
}
```

</div>

أضف التنسيق الجديد إلى الأسفل كالتالي:

<div dir="ltr">

```css
.card {
  font-family: arial;
  font-size: 20px;
  text-align: center;
  color: black;
  background-color: white;
}

.mystyle1 {
  font-family: ayuthaya;
}
```

</div>

تستطيع تضمين أي تنسيق تريده. إذا أدرت تغيير حجم الخط أيضًا، فستعدل قسم mystyle1
ليبدو هكذا:

<div dir="ltr">

```css
.mystyle1 {
  font-family: ayuthaya;
  font-size: 30px;
}
```

</div>

من الممكن أيضًا تضمين خطوط مخصصة مع رزمتك، لكي لا تحتاج إلى تنصيبها في حاسوبك
أو هاتفك المحمول. انظر قسم [تنصيب الخطوط](#installing-fonts) لمزيد من المعلومات.

## أزرار إعادة تشغيل الصوت {#audio-replay-buttons}

عندما يكون هناك تسجيل صوتي أو تحويل نص إلى كلام في بطاقاتك، سيظهر أنكي أزرارًا تستطيع
الضغط عليها لإعادة تشغيل الصوت.

بإمكانك إخفاء هذه الأزرار من خلال نافذة التفضيلات إذا كنت تفضل عدم رؤيتها.

تستطيع تخصيص مظهر هذه الأزرار. تستطيع استخدام التالي لجعلها أصغر وبألوان مختلفة مثلًا:

<div dir="ltr">

```css
.replay-button svg {
  width: 20px;
  height: 20px;
}
.replay-button svg circle {
  fill: blue;
}
.replay-button svg path {
  stroke: white;
  fill: green;
}
```

</div>

## اتجاه النص {#text-direction}

إذا كنت تستخدم لغة تكتب من اليمين إلى اليسار، مثل العربية أو العبرية، تستطيع إضافة
خاصية `direction` لقسم .card لكي تعرض البطاقات بشكل صحيح عند المراجعة:

```css
.card {
  direction: rtl;
}
```

سيغير هذا اتجاه كامل البطاقة. تستطيع تغيير اتجاه حقول معينة فقط بإحاطتها بكود HTML كالتالي:

    <div dir="rtl">{{أمام}}</div>

لتغيير اتجاه الحقول في المحرر، انظر قسم [التحرير](../editing.md#customizing-fields).

## HTML آخر {#other-html}

يمكن أن تحوي قوالبك على أي HTML، ما يعني أنه يمكن استخدام كل التخطيطات الممكنة
في صفحات الويب في بطاقاتك. أشياء مثل الجداول، والقوائم، والصور، والروابط إلى صفحات خارجية
وما إلى ذلك - كلها مدعومة. باستخدام الجداول مثلًا، تستطيع تغيير التخطيط بحيث يظهر
الجانب الأمامي والخلفي في بطاقة على اليسار واليمين بدلًا من الأعلى والأسفل.

إن تغطية كل ميزات HTML خارج نطاق هذا الدليل، لكن هناك كثير من الأدلة التعريفية الجيدة
حول HTML متوفرة على الويب إذا أردت تعلم المزيد.

## مظهر المتصفح {#browser-appearance}

إذا كانت قوالب بطاقاتك معقدةـ، فقد يكون من الصعب قراءة عمودي السؤال والجواب
(التي تدعى «أمام» و «خلف») في [قائمة البطاقات](../browsing.md#cardnote-table).
يسمح لك خيار «مظهر المتصفح» بتعريف قالب مخصص ليُستخدم في المتصفح فقط،
حيث يمكنك تضمين الحقول المهمة فقط وتغيير الترتيب إذا أردت. الصياغة هي مثل صياغة
قوالب البطاقات العادية.

## CSS خاص بمنصة معينة {#platform-specific-css}

يعرّف أنكي عدة فئات CSS خاصة تسمح لك بتعريف تنسيقات مختلفة لمنصات مختلفة.
يظهر المثال في الأسفل كيفية تغيير الخط اعتمادًا على المنصة التي تراجع منها:

<div dir="ltr">

```css
.win .jp {
  font-family: "MS Mincho";
}
.mac .jp {
  font-family: "Hiragino Mincho Pro";
}
.linux .jp {
  font-family: "Kochi Mincho";
}
.mobile .jp {
  font-family: "Hiragino Mincho ProN";
}
```

</div>

وفي القالب:

<div dir="ltr">

```html
<div class=jp>{{Field}}</div>
```

</div>

تستطيع استخدام '<span dir="ltr">.iphone</span>' و '<span dir="ltr">.ipad</span>' لأجهزة آي أو إس المختلفة.

تستطيع استخدام خصائص مثل <span dir="ltr">.gecko</span> و <span dir="ltr">.opera</span>
و <span dir="ltr">.ie</span> لتحديد متصفحات محددة عند استخدام أنكي ويب.
انظر <http://rafael.adm.br/css_browser_selector/> لقائمة الخيارات كاملة.

## تنصيب خطوط {#installing-fonts}

إذا كنت تستخدم أنكي على حاسوب العمل أو المدرسة حيث ليس لديك إذن بتنصيب خطوط جديدة،
أو إذا كنت تستخدم أنكي على هاتف محمول، فمن الممكن إضافة خطوط إلى أنكي مباشرة.

يجب أن يكون الخط الذي تريد إضافته بصيغة TrueType. لخطوط TrueType أسماء
تنتهي بلاحقة <span dir="ltr">.ttf</span> مثل "Arial.ttf".
بعد أن تحدد موقع خط TrueType، تحتاج إلى إضافته إلى مجلد الوسائط:

1. أضف شرطة تحتية (_) إلى اسم الملف ليصبح مثل <span dir="ltr">"\_arial.ttf"</span>.
   إضافة شرطة تحتية تخبر أنكي أن هذا الملف سيُستخدم في قالب، ولا يجب حذفه
   عند فحص الوسائط غير المستخدمة.

2. في متصفح ملفات حاسوبك، اذهب إلى [مجلد أنكي](../files.md)، ثم مجلد يدعى
   «مستخدم 1» (أو اسم ملفك الشخصي إذا أعدت تسميته أو أضفت ملفًا جديدًا).

3. داخل المجلد، يجب أن ترى مجلدًا باسم collection.media. انسخ ملف الخط
   إلى هذا المجلد.

علينا تحديث القالب بعد ذلك:

1. اضغط **إضافة** في أعلى النافذة الرئيسية، وحدد نوع الملحوظة الذي تريد تغييره
   من خلال الزر في أعلى اليسار.

2. اضغط **بطاقات**.

3. في قسم التنسيق، أضف النص التالي إلى الأسفل (بعد رمز <span dir="ltr">"}"</span> الأخير)،
   مستبدلًا <span dir="ltr">"\_arial.ttf"</span> باسم الملف الذي تريد نسخه إلى مجلد الوسائط:

<div dir="ltr">

```css
@font-face {
  font-family: myfont;
  src: url("_arial.ttf");
}
```

</div>

غير جزء "arial" فقط، وليس "myfont".

بعد ذلك، تستطيع إما تغيير خط البطاقة كاملة، أو حقول فردية. لتغيير خط البطاقة كاملة،
ابحث عن سطر <span dir="ltr">font-family:</span> في قسم <span dir="ltr">.card</span>
وغير الخط إلى "myfont". لتغيير خط حقول محددة فقط،
انظر تعليمات [تنسيق الحقول](#field-styling) في الأعلى.

تأكد أن أسماء الملفات تتطابق. إذا كان اسم الملف arial.TTF فكتابة arial.ttf لن تعمل.

## الوضع الليلي {#night-mode}

تستطيع تخصيص مظهر القوالب عندما يكون الوضع الليلي مفعلًا في نافذة التفضيلات.

إذا أردت خلفية رمادية أفتح، قد تستخدم التالي:

<div dir="ltr">

```css
.card.nightMode {
  background-color: #555;
}
```

</div>

إذا كان لديك تنسيق 'myclass'، فسيظهر الكود التالي النص بلون أصفر عندما يكون
الوضع الليلي مفعلًا:

<div dir="ltr">

```css
.nightMode .myclass {
  color: yellow;
}
```

</div>

## التلاشي والتنقل {#fading-and-scrolling}

سينقلك أنكي إلى قسم الجواب بشكل افتراضي. إنه يبحث عن عنصر HTML بمعرف <span dir="ltr">id=answer</span>،
وينتقل إليه. تستطيع وضع المعرّف في عنصر مختلف لتغيير موقع الانتقال، أو حذفه لإيقاف الانتقال.

يتلاشى جانب السؤال ببطء بشكل افتراضي. إذا أدرت ضبط فترة التلاشي، تستطيع وضع التالي
في أعلى القالب الأمامي:

<div dir="ltr">

```html
<script>qFade=100; if (typeof anki !== 'undefined') anki.qFade=qFade;</script>
```

</div>

100 (مللي ثانية) هي المدة الافتراضية؛ غيرها إلى 0 لإيقاف تأثير التلاشي.

## جافا سكريبت {#javascript}

من الممكن تضمين بعض أكواد جافا سكريبت في البطاقات من خلال القالب حيث إن بطاقات أنكي
هي بمثابة صفحات ويب. انظر [هذا المنشور](https://forums.ankiweb.net/t/card-templates-user-input-101-buttons-keyboard-shortcuts-etc-guide/13756) في المنتديات لدليل تعليمي جيد.

لأن جافا سكريبت ميزة متقدمة وهناك عدة أشياء قد تسبب المشاكل، **فإن ميزة جافا سكريبت
موفرة بدون أي دعم أو ضمانة**. لا نستطيع توفير أي مساعدة لكتابة جافا سكريبت، ولا ضمان
استمرارية عمل أي كود كتبته بدون تغيير في إصدارات أنكي المستقبلية. إذا لم تكن لديك
القدرة على إصلاح أي مشاكل قد تواجهك بنفسك، فالرجاء تجنب استخدام جافا سكريبت.

قد يطبق كل برنامج لأنكي عرض البطاقات بشكل مختلف، لذلك فستحتاج إلى اختبار السلوك
في عدة منصات. تعمل بعض البرامج من خلال إبقاء صفحة ويب تعمل لمدة طويلة وتحديث
أجزاء منها بشكل ديناميكي عند مراجعة البطاقات، لذلك يحتاج كود جافا سكريبت الخاص بك
إلى تحديث أقسام من الوثيقة باستخدام أشياء مثل <span dir="ltr">document.getElementById()</span> بدلًا
من أشياء مثل <span dir="ltr">document.write()</span>.

لا تتوفر دوال مثل window.alert أيضًا. سيكتب أنكي أخطاء جافا سكريبت في الطرفية،
لذلك إذا كنت تعمل على حاسوب ماك أو ويندوز، فستحتاج إلى التقاط الأخطاء يدويًا وكتابتها
إلى الوثيقة لرؤيتها. لا يتوفر مشخص أخطاء، لذلك عليك تجزيء أكوادك حتى تكتشف الأجزاء
التي تسبب مشاكل.
