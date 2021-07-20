<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta charset="utf-8" />
	<title>中国传统色-寻找文物中的中国色彩</title>
	<meta name="keywords" content="中国传统色，中国色，传统颜色，传统色彩，色彩文化" />
	<meta name="description" content="寻找文物中的中国色彩" />
	<link rel="shortcut icon" href="./img_/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="./css/style.css" />
	<link rel="stylesheet" type="text/css" href="./css/fullpage.min.css" />
	<link rel="stylesheet" type="text/css" href="./css/font-awesome.min.css">
	<!-- Powered by https://github.com/FortAwesome/Font-Awesome -->
	<script type="text/javascript" src="./js/jquery-3.6.0.min.js"></script>
	<!-- Powered by https://github.com/jquery/jquery -->
	<script type="text/javascript" src="./js/jquery.color.plus-names-2.2.0.min.js"></script>
	<!-- Powered by https://github.com/jquery/jquery-color -->
	<script type="text/javascript" src="./js/fullpage.min.js"></script>
	<!-- Powered by https://github.com/alvarotrigo/fullPage.js -->
	<script type="text/javascript" src="./js/clipboard.min.js"></script>
	<!-- Powered by https://github.com/zenorocha/clipboard.js -->
	<script type="text/javascript">
		$(document).ready(function () {
			$('#fullpage').fullpage({
				// 锚点设置
				anchors: ['homePage', '1Page', '2Page', '3Page', '4Page', '5Page', '6Page', '7Page', '8Page',
					'9Page'
				],
				menu: "#menu",
				onLeave: function (origin, destination, direction) {
					var leavingSection = this;
					var colorsChangeMenu = new Array("rgba(177, 59, 46, 1)", "rgba(177, 59, 46, 1)",
						"rgba(241, 143, 96, 1)", "rgba(255, 238, 111, 1)", "rgba(93,131,81,1)",
						"rgba(188,212,231,1)", "rgba(111,148,205,1)", "rgba(138,24,116,1)");
					// 清除项目背景颜色
					$("#menu a[href='#" + origin.index + "Page']").css("background-color", "")
					// 增加项目背景颜色（渐变）
					$("#menu a[href='#" + destination.index + "Page']").animate({
						backgroundColor: colorsChangeMenu[destination.index]
					}, 100)
					//清除画笔图标
					$(".fa-paint-brush").remove()
					//增加画笔图标
					$("<i class='fa fa-paint-brush'></i>").prependTo("#menu a[href='#" + destination
						.index + "Page']")
				}
			})
			//侧栏动态折叠
			var flag = false;
			$("div.colorinfo label").click(function () {
				if (flag) {
					$("div.colorinfo label,input").animate({
						right: '0'
					})
					$("div.colorinfo label").css({
						transform: '',
					})
					$("div.info").animate({
						right: '-550px'
					})
					flag = false;
				} else if (!flag) {
					$("div.colorinfo label,input").animate({
						right: '550px'
					})
					$("div.colorinfo label").css({
						transform: 'rotateY(180deg)',
					})
					$("div.info").animate({
						right: '0'
					})
					flag = true;
				}
			})
			//点击色块复制颜色值
			var clipboard = new ClipboardJS('.cube');
			clipboard.on('success', function () {
				alert("复制色值（RGB）成功，请检查你的剪贴板！");
			})
			//留言板开启
			$("#msg").click(function () {
				$("#mask").css("visibility", "visible");
				$("#message").css("visibility", "visible");
				$("#message textarea").val("");
			})
			//留言板关闭
			$("#message input").click(function () {
				$("#mask").css("visibility", "hidden");
				$("#message").css("visibility", "hidden");
				$("#message textarea").val("");
			})
			//深色模式
			var moon = false;
			$("body").delegate("#moon", "click", function () {
				if (moon) {
					$("div").not("#message").css("color", "black");
					$("#menu").find("*").css("color", "black");
					$("#footer").find("p").css("color", "black");
					$("body").css("background-image",
						"url(https://github.com/Rzerofour/ChineseTraditionalColors/blob/main/img_/logobackground.png?raw=true)"
					);
					$(".info").css("background-color", "white");
					$(".box").css("background-color", "whitesmoke");
					$(".info").find("*").not(".cube").css("background-color", "white");
					$("#menu").css("background-color", "rgba(0, 0, 0, 0)");
					moon = false;
				} else if (!moon) {
					$("div").not("#message").css("color", "white");
					$("#menu").find("*").css("color", "white");
					$("#footer").find("p").css("color", "black");
					$("body").css("background-image",
						"url(https://github.com/Rzerofour/ChineseTraditionalColors/blob/main/img_/moon.jpg?raw=true)"
					);
					$(".info").css("background-color", "rgba(41,40,45,1)");
					$(".info").find("*").not(".cube").css("background-color", "rgba(45,46,54,1)");
					$("#menu").css("background-color", "rgba(45,46,54,1)");
					moon = true;
				}
			})
		})
	</script>
</head>

<body>
	<!-- 导航栏 -->
	<nav id="menu">
		<ul>
			<li data-menuanchor="homePage"><a href="#homePage"><i class="fa fa-home fa-lg"></i></a></li>
			<li data-menuanchor="1Page"><a href="#1Page">红</a></li>
			<li data-menuanchor="2Page"><a href="#2Page">橙</a></li>
			<li data-menuanchor="3Page"><a href="#3Page">黄</a></li>
			<li data-menuanchor="4Page"><a href="#4Page">绿</a></li>
			<li data-menuanchor="5Page"><a href="#5Page">蓝</a></li>
			<li data-menuanchor="6Page"><a href="#6Page">靛</a></li>
			<li data-menuanchor="7Page"><a href="#7Page">紫</a></li>
			<li id="rm"><a href="https://github.com/Rzerofour/ChineseTraditionalColors#readme" target="_blank"><i
						class="fa fa-info fa-lg"></i></a></li>
			<li id="msg"><a><i class="fa fa-commenting-o fa-lg"></i></a></li>
			<li id="moon"><a><i class="fa fa-moon-o fa-lg"></i></a></li>


		</ul>
	</nav>
	<!-- 留言板 -->
	<div id="mask"></div>
	<div id="message">
		<form>
			<h1>你可以在这里写下你的留言！</h1>
			<textarea></textarea>
			<input type="submit" value="提交" />
			<input type="reset" value="取消" />
		</form>
	</div>
	<!-- 内容 -->
	<section id="main">
		<div id="fullpage">
			<div class="section active" id="section0">
				<div class="img"><img data-src="./img_/首页_.png" alt="《乾隆帝月令七十二候诗》彩色墨" title="《乾隆帝月令七十二候诗》彩色墨" /></div>
				<div class="iteminfo">
					<h2>欢迎来到</h2>
					<h1>中国传统色！</h1>
					<ul>
						<li>在这里您可以：</li>
						<li><i class="fa fa-eye"></i> 欣赏中国传统色彩</li>
						<li><i class="fa fa-lightbulb-o"></i> 了解中国文物知识</li>
						<li><i class="fa fa-book"></i> 阅读色彩背后的故事</li>
						<li><i class="fa fa-pencil"></i> 点击即可使用颜色</li>
						<li><i class="fa fa-comments-o"></i> 与我们共同交流学习</li>
					</ul>
				</div>
			</div>
			<div class="section" id="section1">
				<div class="img"><img data-src="./img_/红_.png" alt="雍正款仿钧窑变釉弦纹扁肚瓶" title="雍正款仿钧窑变釉弦纹扁肚瓶" /></div>
				<div class="iteminfo">
					<p> 雍正款仿钧窑变釉弦纹扁肚瓶，清雍正，高25.5厘米，口径7.3厘米，足径12厘米。瓶唇口、细长颈、颈、肩部凸起七道弦纹、扁圆腹，形如荸荠，故称荸荠扁瓶。圈足。外底刻划篆体“雍正年制”四字双行款。胎体厚重，从近底部釉可以看出系采用多次施釉而成。器内施天蓝色窑变釉，器外施红色窑变釉，釉面尤如丛丛燃烧的火焰，自然垂流至近底处，红色中闪现着蓝色星点，变幻迷离，绚丽多彩。足内釉面不匀。钧窑因其变幻莫测的釉色被后世追仿，雍正时期督陶官唐英为了仿烧钧窑瓷器曾于雍正七年（1729年）三月派厂署幕友吴尧圃亲赴钧州，调查钧窑釉料配制法。据清宫造办处档案记载，雍正八年（1730年）三月已做得仿钧窑瓶，十月年希尧呈进仿钧窑瓷炉大小十二件，受到皇帝的赞赏“此炉烧造甚好，传与年希尧照此样再多烧几件”。由此说明，雍正时期由于唐英的努力，仿烧钧窑瓷器已达到了相当高的水平。此瓶釉面仿宋代钧窑瓷器窑变釉，器型却是宋代钧窑瓷器中所不见，为雍正时期创新之作。
					</p>
				</div>
				<div class="colorinfo">
					<input type="checkbox" id="checkbox1">
					<label for="checkbox1">
						<i class="fa fa-chevron-left fa-5x"></i>
					</label>
					<div class="info">
						<div class="box">
							<div class="cube" data-clipboard-text="203,82,62"
								style="background-color:rgba(203, 82, 62, 1) ;"></div>
							<div class="name"><ruby>赩<rt>xì</rt></ruby>炽</div>
							<div class="intro">
								赤红如火，光亮艳炽。左思《蜀都赋》曰”丹沙赩炽出其坂，蜜房郁毓被其阜”。李周翰注“赩炽，赤光，丹砂色也”。陶拱《五色比象赋》曰“青为山兮峣嶷而争峻，赤为火兮赩炽而含燠”。朱景英《龚蕙亩宣副帅招同任伯卿将军登赤嵌城望海作》咏“厥状赩炽出绀鬘,屹然百雉凌飞湍”。
							</div>
						</div>
						<div class="box">
							<div class="cube" data-clipboard-text="177,59,46"
								style="background-color:rgba(177, 59, 46, 1) ;"></div>
							<div class="name">石榴裙</div>
							<div class="intro">色挟石榴之红,裙带美人之姿。杜审言《戏
								赠赵使君美人》咏“红粉青娥映楚云,桃花马上石榴裙”。武则天《如意娘》咏“不信比来长下泪,开箱验取石榴裙”。白居易《官宅》咏“移舟木兰棹,行酒石榴裙”,又《和春深二十首》咏“眉欺杨柳叶,裙妒石榴花”。万楚《五日观妓》咏“眉黛夺将萓草色,红裙妒杀石榴花”。
							</div>
						</div>
						<div class="box">
							<div class="cube" data-clipboard-text="149,48,46"
								style="background-color:rgba(149, 48, 46, 1) ;"></div>
							<div class="name">朱湛</div>
							<div class="intro">
								语出《周礼・考工记》“钟氏染羽,以朱湛丹秫,三月而炽之,淳而渍之。三入为纁,五入为緅,七入为缁”。朱湛的湛字是浸溃的意思,丹秫的秫字是黏性谷物的意思,朱湛丹秫就是将朱砂与黏性谷物一起浸渍和发酵,以期朱砂颜料能够借由淀粉黏度而更好地附着于织物。经过三个月到达最佳的状态,再浸泡。三入、五入、七入指浸泡的次如要取得较深的、较鲜艳的色相的话,就必须反复地染色。朱湛就是厚重的红色。
							</div>
						</div>
						<div class="box">
							<div class="cube" data-clipboard-text="130,35,39"
								style="background-color:rgba(130,35,39,1) ;"></div>
							<div class="name">大<ruby>繎<rt>rán</rt></ruby></div>
							<div class="intro">
								史游《急就篇》有“蒸栗绢绀缙红繎”一句,颜师古注“蒸栗,黄色,若蒸孰之栗也。娟，生白缯,似缣而疏者也,一名鲜支。绀,青而赤色也。缙,浅赤色也。红,色赤而白也。繎者,红色之尤深,言若火之然也”。大繎,其色大开大放,如火如茶。
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="section" id="section2">
				<div class="img"><img data-src="./img_/橙_.png" alt="金胎珊瑚桃式盒" title="金胎珊瑚桃式盒" /></div>
				<div class="iteminfo">
					<p>金胎珊瑚桃式盒，清，高19厘米，长22.5厘米，宽20厘米。盒为桃形，分为器和盖两部分。盒内为金胎，外为红珊瑚面，满琢纹饰。顶中部琢一篆书团“寿”字，字上面凸雕一展翅的蝙蝠，寓福寿之意。盒上半部琢云气纹，云气中有9条龙游弋其中，龙身辗转腾跃，时隐时现，极为生动。下半部琢海水托云气纹，海水湍急。此盒造型生动，金胎外面的珊瑚系由多块珊瑚粘接而成，严丝合缝，毫无破绽，工艺复杂，技艺精湛，珊瑚成色上佳。此器既可做清代后妃们盛放珍宝的首饰盒，又可做精美的工艺陈设品。此盒藏有一对。
					</p>
				</div>
				<div class="colorinfo">
					<input type="checkbox" id="checkbox2">
					<label for="checkbox2">
						<i class="fa fa-chevron-left fa-5x"></i>
					</label>
					<div class="info">
						<div class="box">
							<div class="cube" data-clipboard-text="245,176,135"
								style="background-color:rgba(245,176,135, 1) ;"></div>
							<div class="name"><ruby>骍<rt>xīng</rt></ruby>刚</div>
							<div class="intro">
								《周礼・地官・草人》日“凡粪种,骍刚用牛,赤缇用羊”。这里,骍刚是赤黄色的土壤。《诗经・鲁颂・网官》日“秋而载尝夏而福衡,白牡骍刚”。这里,骍刚是赤黄色的公牛。沈昌宇《宝盘歌》咏“祭告清庙牵骍刚,股肱二虢同趋跄”。
							</div>
						</div>
						<div class="box">
							<div class="cube" data-clipboard-text="241,143,96"
								style="background-color:rgba(241,143,96, 1) ;"></div>
							<div class="name"><ruby>赪<rt>chēng</rt></ruby>霞</div>
							<div class="intro">
								《尔雅》日“一染谓之縓,再染谓之赪,三染谓之纁”。江淹《齐太祖高皇帝诔》日“赪霞拂朝,苍烟懵夕”。刘崧《楚酒苦如檗歌》咏“丹田微蒸香露溢,着面已觉赪霞生”。严嵩《海天春晓图歌为桂翁作》咏“赪霞紫炁摇青葱,曦轮涌出扶桑东”。解缙《题杏林精舍图》咏“开花二三月,绕天红雨垂。勃如赪霞烂,郁若云离披”。日出日落,赪色之霞,轻红烂漫。
							</div>
						</div>
						<div class="box">
							<div class="cube" data-clipboard-text="239,132,93"
								style="background-color:rgba(239,132,93, 1) ;"></div>
							<div class="name"><ruby>赪<rt>chēng</rt></ruby>尾</div>
							<div class="intro">
								语出《诗经・周南·汝坟》“鲂鱼赪尾,王室如毁”。毛传“赪,赤也,鱼劳则尾赤”。张协《七命》日“范公之鳞,出自九溪,赪尾丹鳃,紫翼青鬐”。韦庄《和郑拾遗秋日感事一百韵》咏“黑头期命爵,赪尾尚忧鲂”。陆游《秋兴》咏“白头韭美腌齑熟,尾鱼鲜斫鲙成”。梅尧臣《颖上得鲤鱼为怀余姚谢师厚》咏“青蓑潭上老,赪尾网中鱼”。刘弇《招季山还家》咏“绿葵白芋故园老,黄颊尾前溪肥”。
							</div>
						</div>
						<div class="box">
							<div class="cube" data-clipboard-text="237,109,70"
								style="background-color:rgba(237,109,70, 1) ;"></div>
							<div class="name">朱柿</div>
							<div class="intro">
								王逸《荔支赋》曰“宛中朱柿,房陵缥李,酒泉白柰”。张蕴《朱柿》咏“慈恩分种远,骈实渥如丹”。谢肃《咏荔枝闽宪作》咏“星球朱柿杂硫黄,磊落千林带海旁”。王世贞《元瑞计偕过吴入访弇中留饮有赠》咏“鸾刀缕黄颌,雕盘钉朱柿”。李之世《迁馆》咏“庭木醉霜华,朱柿与黄橘”。
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="section" id="section3">
				<div class="img"><img data-src="./img_/黄_.png" alt="淡黄釉瓶" title="淡黄釉瓶" /></div>
				<div class="iteminfo">
					<p>淡黄釉瓶，清雍正，高14.6厘米，口径3.3厘米，足径1.7厘米。瓶撇口，细颈，溜肩，肩下渐敛，圈足。通体及足内施淡黄釉。外底暗刻篆书“大清雍正年制”三行六字款。淡黄釉瓷器创烧于雍正时期，其着色剂为氧化锑，由于其釉色比以氧化铁为着色剂的传统浇黄釉浅淡，故名“淡黄釉”。又因其釉色淡雅似蛋黄色，故又称“蛋黄釉”。雍正十三年（1735年）督陶官唐英撰写的《陶成纪事》中称之为“西洋黄”。雍正淡黄釉瓷器的造型多为小件的瓶、盘、碗、杯、碟等，小巧的形体配以淡雅的釉色，颇显俊秀典雅。清代雍正瓷器素以造型娟秀、胎釉精细著称于世。此瓶由康熙时的柳叶瓶演变而来，其娇美之形体，恬静之釉质，集中体现了雍正瓷器的艺术风格。
					</p>
				</div>
				<div class="colorinfo">
					<input type="checkbox" id="checkbox3">
					<label for="checkbox3">
						<i class="fa fa-chevron-left fa-5x"></i>
					</label>
					<div class="info">
						<div class="box">
							<div class="cube" data-clipboard-text="255,247,153"
								style="background-color:rgba(255,247,153, 1) ;"></div>
							<div class="name">黄白游</div>
							<div class="intro">
								金银气色,若白轻黄。《史记・孝武本纪》载“合兹中山,有黄白云降盖,若兽为符，路弓乘矢,集获坛下,报祠大飨”。汤显祖《有友人怜予乏劝为黄山白岳之游》咏“欲识金银气,多从黄白游。一生痴绝处,无梦到徽州”。黄山白岳间,喜其南柯痴绝,纂取诗意而命名此色。屈大均《送人返徽州》“黄山白岳梦魂同,之子乘秋一杖还”。
							</div>
						</div>
						<div class="box">
							<div class="cube" data-clipboard-text="255,238,111"
								style="background-color:rgba(255,238,111, 1) ;"></div>
							<div class="name">松花</div>
							<div class="intro">
								苏敬《新修本草》云“松花名松黄,拂取似蒲黄。正尔酒服轻身,疗病云胜皮、叶及脂”。李匡义《资暇录》云“松花笺代以为薛涛笺误也。松花笺其来旧矣”。李白《酬殿明佐见赠五云裘歌》咏“轻如松花落金粉,浓似苔锦含碧滋”。韦庄《乞彩笺歌》“班班布在时人口,满袖松花都未有”。王建《设酒寄独孤少府》咏“自看和酿一依方,缘看松花色較黄”。景焕《牧竖闲谈》云“于是涛别模新样小幅松花纸,多用题诗,因寄献元公百余幅”。李石《续博物志》“元和中,元稹使蜀,营妓薛涛造十色彩笺以寄,元稹于松花纸上寄诗赠涛”。
							</div>
						</div>
						<div class="box">
							<div class="cube" data-clipboard-text="236,212,82"
								style="background-color:rgba(236,212,82, 1) ;"></div>
							<div class="name">缃叶</div>
							<div class="intro">
								许慎《说文解字・糸部》注“缃,帛浅黄色也”。刘熙《释名·释采帛》注“缃,桑也,如桑叶初生之色也”。王僧达《诗》咏“缃叶未开萼,红葩已发光”。李峤《荷》咏“鱼戏排缃叶,龟浮见绿池”。夏竦《皇帝听讲尚书彻太清楼赐宴》咏“赐花缃叶缀,劝酒玉卮传”,又《宣赐翠芳亭双头并蒂牡丹仍令赋诗》咏“红房争并萼,缃叶竞骈枝”。葛立方《小酌以诗招道祖分茶》咏“宝胯开细叶,香尘堕柘罗”。
							</div>
						</div>
						<div class="box">
							<div class="cube" data-clipboard-text="182,160,20"
								style="background-color:rgba(182,160,20, 1) ;"></div>
							<div class="name">苍黄</div>
							<div class="intro">
								《黄帝内经・素间·五常政大论》载“其色苍黄”。王冰注“色黄之物,外兼苍也”。《墨子・所染》日“染于苍则苍,染于黄则黄,所以入者变,其色也变”。春之初立,切都在生长变化,以其不确定而命名此色。元稹《酬李六醉后见寄口号》咏“健羨觥飞酒,苍黄日映篱”。李商隐《李夫人三首》咏“土花漠碧云茫茫,黄河欲尽天苍黄”,又《有感二首》咏“苍黄五色棒,掩遏一阳生”。
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="section" id="section4">
				<div class="img"><img data-src="./img_/绿_.png" alt="素三彩海蟾纹三足洗" title="素三彩海蟾纹三足洗" /></div>
				<div class="iteminfo">
					<p>素三彩海蟾纹三足洗，明正德，高10.8厘米，口径23.7厘米，足距17.8厘米。洗口内敛，平底，下承三如意头式足，口沿黄彩暗刻楷书“正德年制”四字款，内施青白釉，外壁刻划16个海中嬉游的蟾蜍，纹饰构图简练。以黄彩绘蟾蜍，绿彩绘海水，白彩绘浪花，紫彩涂口、足，色彩和谐分明，清爽悦目。传世的正德素三彩已屈指可数，这件洗可谓是稀世珍品。洗在古代生活中用途广泛，有盥洗用具，亦有文房用具或陈设品。其形制广口，折沿，宽唇，深腹，平底。汉至晋代流行在器物内底刻鱼纹，有陶、青瓷制品。宋代南北瓷窑普遍烧造。明清时则以江西景德镇窑的青花、五彩、粉彩及斗彩等陶瓷制品为佳。
					</p>
				</div>
				<div class="colorinfo">
					<input type="checkbox" id="checkbox4">
					<label for="checkbox4">
						<i class="fa fa-chevron-left fa-5x"></i>
					</label>
					<div class="info">
						<div class="box">
							<div class="cube" data-clipboard-text="106,141,82"
								style="background-color:rgba(106,141,82, 1) ;"></div>
							<div class="name">石发</div>
							<div class="intro">
								周处《风土记》日“石发,水苔也,青绿色,皆生于石”。杨婀《青苔赋》日“别生分类,西京南越,则乌韭兮绿钱,金苔兮石发”。陆龟蒙《苔赋》日“高有瓦苔,卑有泽葵。散岩窦者日石发,补空田者日垣衣。在屋曰昔邪,在药日陟厘”。林逋《过芜湖县》咏“更好两三僧院舍,松衣石发斗山幽”。苏轼《慈湖夹阻风五首》咏“千顷桑麻在船底,空余石发挂鱼衣”。李时珍《本草纲目》日“石发有二,生水中者为陟厘，生陆地者为乌韭”。
							</div>
						</div>
						<div class="box">
							<div class="cube" data-clipboard-text="93,131,81"
								style="background-color:rgba(93,131,81, 1) ;"></div>
							<div class="name">漆姑</div>
							<div class="intro">
								漆姑草,可入药,可入色。张彦远《历代名画记・论画体工用拓写》云“云中之鹿胶,吴中之鳔胶,东阿之牛胶,漆姑汁,炼煎并为重彩,郁而用之”。注日“古画皆用漆姑汁,若炼煎谓之郁色,于绿色上重用之”。史鉴《澄上人房紫牡丹开觞予以酒因诗以记》咏“又无仙家漆姑汁,可使浓华不凋落”。
							</div>
						</div>
						<div class="box">
							<div class="cube" data-clipboard-text="79,121,74"
								style="background-color:rgba(79,121,74, 1) ;"></div>
							<div class="name"><ruby>芰<rt>jì</rt></ruby>荷</div>
							<div class="intro">
								菱叶与荷叶的颜色,这是屈原大夫反复吟诵的清新与美好。语出《楚辞·离骚》“制芰荷以为衣令,集芙蓉以为裳”。萧绎《采莲赋》日“紫茎兮文波,红莲兮芰荷”。谢灵运《石壁精舍还湖中作》咏“芰荷迭映蔚,蒲稗相因依”。贺知章《采莲曲》咏“莫言春度芳非尽,别有中流采芰荷”。罗隐《宿荆州江陵驿》咏“风动芰荷香四散,月明楼阁影相侵”。黄庭坚《鄂州南楼书事四首》咏“四顾山光接水光,凭栏十里菱荷香”。
							</div>
						</div>
						<div class="box">
							<div class="cube" data-clipboard-text="42,110,63"
								style="background-color:rgba(42,110,63, 1) ;"></div>
							<div class="name">官绿</div>
							<div class="intro">
								陆游《遣兴》咏“风来弱柳摇官绿,云破奇峰涌帝青”。《碎金》云“青:佛头青、鸦青、粉青、蓝青、天水碧、柳芳绿、鹦哥绿、官録、鸭绿、麦绿”。宋应星《天工开物》云“大红官绿色,槐花煎水染,蓝淀盖,浅深皆用明矶”。陶宗仪《南村辍耕录・采绘法》云“官绿,即枝条绿是”。《广群芳谱》云“(绿豆)粒粗而色鲜者为官绿,又名明绿,皮薄粉多。粒小而色暗者为油绿,又名灰绿,皮厚粉少”。
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="section" id="section5">
				<div class="img"><img data-src="./img_/蓝_.png" alt="天蓝釉双龙耳瓶" title="天蓝釉双龙耳瓶" /></div>
				<div class="iteminfo">
					<p>天蓝釉双龙耳瓶，清雍正，高51.8厘米，口径11.7厘米，足径13.7厘米。瓶洗口，细颈，溜肩，肩以下渐收敛，圈足。通体施天蓝色釉，凸起数道弦纹，两侧口、肩之间对称置龙形柄，肩部有八组椭圆形模印贴花装饰。外底署青花篆体“大清雍正年制”六字三行款。此瓶造型仿自唐代白釉或三彩双龙耳瓶。雍正天蓝釉瓷器的烧造在康熙的基础上有了进一步的发展，形成深浅不一的两种釉色，深若雨后晴空，淡趋月白。另外，康熙朝的天蓝釉瓷器多为小件文房用具，而雍正时出现行体较大的天蓝釉瓷器，如罐、瓶、缸、花盆等。
					</p>
				</div>
				<div class="colorinfo">
					<input type="checkbox" id="checkbox5">
					<label for="checkbox5">
						<i class="fa fa-chevron-left fa-5x"></i>
					</label>
					<div class="info">
						<div class="box">
							<div class="cube" data-clipboard-text="212,229,239"
								style="background-color:rgba(212,229,239, 1) ;"></div>
							<div class="name">月白</div>
							<div class="intro">
								宋应星《天工开物》载“月白、草白二色,俱靛水微染,今法用苋蓝煎水,半生半熟染”。李渔《闲情偶记》载“记子儿时所女子之少者,尚银红、桃红,稍长者尚月白。未几而银红桃红皆变大红,月白变蓝,再变则大红变紫,蓝变石青”。由是见,月白、蓝、石青是由浅及深的蓝色。杜牧《猿》咏“月白烟青水暗流,孤猿衔恨叫中秋”。陆游《夜汲》咏“酒渴起夜汲,月白天正青”。赵孟频《新秋》咏“露凉催蟋蟀,月白澹芙蓉”。
							</div>
						</div>
						<div class="box">
							<div class="cube" data-clipboard-text="188,212,231"
								style="background-color:rgba(188,212,231, 1) ;"></div>
							<div class="name">星郎</div>
							<div class="intro">
								星蓝,其色上应列宿。《后汉书・显宗孝明帝纪》日:“馆陶公主为子求郎,不许,而赐钱千万。谓群臣曰:“郎官上应列宿,出宰百里,有非其人,则民受其殃,是以难之。””。郑谷《锦二首》咏“红迷天子帆边日,紫夺星郎帐外兰”。岑参《送李别将摄伊吾令充使赴武威便寄崔员外》咏“遥知竹林下,星使对星郎”。徐现《寿曾漕》咏“乾坤清气有时合,合作星郎青似蓝”。
							</div>
						</div>
						<div class="box">
							<div class="cube" data-clipboard-text="163,187,219"
								style="background-color:rgba(163,187,219, 1) ;"></div>
							<div class="name">晴山</div>
							<div class="intro">
								云雾散而晴山蓝。李忱《幸华严寺》咏“云散睛山几万重,烟收春色更冲融”。李峤《和社杜学士江南初霁羁怀》咏“雾卷晴山出,风恬晚浪收”。李白《饯校书叔云》咏“看花饮美酒,听鸟临晴山”。韩琮《晚春江睛寄友人》咏“晩日低霞绮,晴山远画眉”。李薦《渼陂》咏“晴山如黛水如蓝,波浄天澄翠满潭”。文同《晴山》咏“东北横群峰新过夜来雨”。
							</div>
						</div>
						<div class="box">
							<div class="cube" data-clipboard-text="138,171,204"
								style="background-color:rgba(138,171,204, 1) ;"></div>
							<div class="name">品月</div>
							<div class="intro">
								清代服饰流行色,出处与月白相关,其色较月白更蓝。月白、品月、蓝、石青是由浅及深的蓝色。杨慎《题周昉琼枝夜醉图》咏“宝枕垂云选梦,玉萧品月偷声”。金永爵《纪晓岚紫石砚歌》咏“金樱手捧隃麋香,品月题花幽事足”。蒋日豫《抱遗老人空江吹笛小像》咏“乐府嬉春宛转情,玉山品月承平梦”。
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="section" id="section6">
				<div class="img"><img data-src="./img_/靛_.png" alt="雍正款蓝色透明玻璃八棱瓶" title="雍正款蓝色透明玻璃八棱瓶" /></div>
				<div class="iteminfo">
					<p>雍正款蓝色透明玻璃八棱瓶，高14.5厘米，口径2.3厘米，足径4.2厘米。瓶八棱形，细长颈，鼓腹，圈足。通体呈透明宝蓝色，光素无纹饰。外底中心镌双方栏，内双竖行楷书“雍正年制”四字款。从目前的传世品看，玻璃八棱瓶的造型始见于雍正朝，乾隆时期曾以不同色泽的玻璃进行仿制，产品如出一辙，若无款识，则难以分辨。嘉庆以后仍有制作，但造型不规范，质不纯，色不佳，无法与雍、乾制品相提并论。该瓶造型规整，棱角笔直清晰，色泽雅致，晶莹剔透，虽无纹饰，却以其精巧的造型、宝石般的色泽和纯净无暇的质地取胜，格调高雅，显示了清宫玻璃厂高超的技艺，表明清雍正、乾隆二朝的玻璃制作工艺已达到其巅峰。
					</p>
				</div>
				<div class="colorinfo">
					<input type="checkbox" id="checkbox6">
					<label for="checkbox6">
						<i class="fa fa-chevron-left fa-5x"></i>
					</label>
					<div class="info">
						<div class="box">
							<div class="cube" data-clipboard-text="136,171,218"
								style="background-color:rgba(136,171,218, 1) ;"></div>
							<div class="name">窃蓝</div>
							<div class="intro">
								《尔雅・释鸟》日“秋扈,窃蓝”。郭璞注“窃蓝青色”。贾逵注“秋扈窃蓝,趣民收敛者也”。方以智《通雅・衣服・彩色》日凡言窃言盗,皆借色、浅色、闲色也。鸟九扈,有窃脂、窃蓝等色。《尔雅》虎窃毛,谓浅色也;扈之窃脂,言其色如靠肉也;窃蓝,浅蓝也;八骏有盗骊,盗亦窃,意谓浅骊也。古人善巧炼字,大率如此”。窃蓝在汉语言历史上是可考的第一个浅蓝色颜色词,宜存宜保。
							</div>
						</div>
						<div class="box">
							<div class="cube" data-clipboard-text="111,148,205"
								style="background-color:rgba(111,148,205,1) ;"></div>
							<div class="name">监德</div>
							<div class="intro">
								东方之晨星蓝光。语出《史记・天官书》“正月,与斗、牵牛晨出东方,名日监德。色苍苍有光”。司马贞注“岁星正月晨见东方之名”。童轩《感寓》咏“黎民悉于变垂拱成雍照。乃知帝监德,岂在险与夷”。
							</div>
						</div>
						<div class="box">
							<div class="cube" data-clipboard-text="89,118,186"
								style="background-color:rgba(89,118,186, 1) ;"></div>
							<div class="name">苍苍</div>
							<div class="intro">
								或水或天,其色幽蓝;或草或木,茂密盛开。此处,取前者其色也。《庄子·逍遥游》“天之苍苍,其正色邪”。《敕勒歌》咏“天苍苍,野茫茫。风吹草低见牛羊”。《祠洛水歌》咏“洛阳之水,其色苍苍”。
							</div>
						</div>
						<div class="box">
							<div class="cube" data-clipboard-text="46,89,167"
								style="background-color:rgba(46,89,167, 1) ;"></div>
							<div class="name">群青</div>
							<div class="intro">
								中国画传统颜料色,群而有集,青出金石。古时,由青金石矿物研磨加工而成的蓝色颜料称为天然群青,物以稀为贵,近世西方人工合成群青,迅速普及,但是不如天然群青淡雅、庄重。古诗中群青也指草木之青録。楼异《嵩山二十四咏》咏“回头却顾人间世,但见群青似小童”。曾丰《余得英州石山副之五绝句送曾鼎臣》咏“湖上飞来小祝融,群青在侧一居中”。王世贞《袁黄岩寄雁荡图及新诗见示颇怀壮游之感》咏“如分雁荡群青过,忽挾龙湫万玉来”。
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="section" id="section7">
				<div class="img"><img data-src="./img_/紫_.png" alt="雍正款仿钧窑变釉海棠式花盆" title="雍正款仿钧窑变釉海棠式花盆" /></div>
				<div class="iteminfo">
					<p>雍正款仿钧窑变釉海棠式花盆，清雍正，高8厘米，口横16.5厘米，口纵16厘米，
						足横8.5厘米，足纵7厘米。花盆为海棠式、敞口、折沿、深腹壁下斜、平底、底开有两个渗水圆孔、底下承以四个如意云头小足。里、外均施仿钧窑变釉，蓝、紫相间，釉面垂流自然。外底刻划篆体“雍正年制”四字双行款。
					</p>
				</div>
				<div class="colorinfo">
					<input type="checkbox" id="checkbox7">
					<label for="checkbox7">
						<i class="fa fa-chevron-left fa-5x"></i>
					</label>
					<div class="info">
						<div class="box">
							<div class="cube" data-clipboard-text="166,85,157"
								style="background-color:rgba(166,85,157, 1) ;"></div>
							<div class="name">紫蒲</div>
							<div class="intro">
								其色水岸紫蒲,其意生机自然。李贺《昌谷诗》咏“大带委黄葛,紫蒲交狭涘”。张籍《酬白二十二舍人早春曲江见招》咏“紫蒲生湿岸,青鸭戏新波”。许浑《夜归丁卯桥村舍》咏“紫蒲低水槛,红叶半江船”。黄滔《贻宋评事》咏“时说三吴欲归处,绿波洲渚紫蒲丛”。刘仲尹《谒金门》咏“肠新鸳鸯三十六,紫蒲相对浴”。
							</div>
						</div>
						<div class="box">
							<div class="cube" data-clipboard-text="138,24,116"
								style="background-color:rgba(138,24,116, 1) ;"></div>
							<div class="name"><ruby>赪<rt>chēng</rt></ruby>紫</div>
							<div class="intro">
								其色红紫相间,其意绚烂斑驳。谢朓《和刘中书》咏“赪紫共彬驳,云锦相凌乱”。李贺《昌谷诗》咏“苔絮萦涧砾,山实垂赪紫”。更有绘色入画如卫宗武《莺花吟为良友作》“芬菲芳事毕,木芍药晚出。于中姚魏更倾城,扫退目前赪紫色”。再有黎廷瑞《春雪》“青神怯春寒,赪紫染未办”,《桐华》“芳韶歇赪紫,余喧始相寻”。
							</div>
						</div>
						<div class="box">
							<div class="cube" data-clipboard-text="108,33,109"
								style="background-color:rgba(108,33,109, 1) ;"></div>
							<div class="name">齐紫</div>
							<div class="intro">
								齐桓公之帝王紫。《韩非子・外储说左上》曰“齐王好衣紫,齐人皆好也。齐国五素不得一紫。齐王患紫贵,傅说王日:“《诗》云:不躬不亲,庶民不信。今王欲民无衣紫者,王请自解紫衣而朝,群臣有紫衣进者,日:益远!人恐臭。”是日也,郎中莫衣紫;是月也,国中莫衣紫;是罗也,境内莫衣紫”。《史记・苏秦列传》日“智者举事,因祸为福,转败为功。齐紫,败素也,而贾十倍”。《南史・陆庆》日“邹缨齐紫,且以移俗”。杨慎《春郊得紫字张惟信同赋》咏“广幕耀周缇,被服矜齐紫”。归有光《素庵诗》咏“流俗相纠错,纷纷竟齐紫”。
							</div>
						</div>
						<div class="box">
							<div class="cube" data-clipboard-text="66,34,86"
								style="background-color:rgba(66,34,86, 1) ;"></div>
							<div class="name">大<ruby>繎<rt>rán</rt></ruby></div>
							<div class="intro">
								语出李贺《雁门太守行》“角声满天秋色里,塞上燕脂凝夜紫”。不去争论是砌长城的紫土还是生于塞上的紫草,宁可去想象北境悲凉的暗夜天色。胡仔《歌风台》咏“赤帝当年布衣起,老妪悲啼白龙死,芒砀生云疑夜紫”。王恽《木兰花慢・赋红梨花》咏“塞上胭脂夜紫,雪边蝴蝶朝寒”。石宝《熊耳峰》咏“浮岚出晴丹,淑气凝夜紫”。顾翎《菩萨查》咏“纤云凝夜紫,烟落迷廊处”。
							</div>
						</div>
					</div>
				</div>
				<!-- 脚注(与紫色文物合为一页) -->
				<footer class="section fp-auto-height" id="footer">
					<p>
						<a href="https://github.com/Rzerofour/ChineseTraditionalColors" target="_blank"><i
								class="fa fa-github"></i>项目主页</a>|
						<a href="mailto:919107390128@njust.edu.cn?subject=关于中国传统色网站的意见与建议"><i
								class="fa fa-envelope-o"></i>联系我们</a><br />
					</p>
					<p>本网站仅供个人学习网页制作，任意素材若侵犯您的权益请联系我们，我们将在24小时内删除。</p>
					<p>Powerd by <a href="https://github.com" target="_blank">GithubPages</a>.Designed by <a
							href="https://github.com/Rzerofour" target="_blank">Sun Siliang</a> and <a
							href="https://github.com/jingweiwei-os" target="_blank">Jing Weiwei</a>.
					</p>
				</footer>
			</div>
		</div>
	</section>
</body>

</html>