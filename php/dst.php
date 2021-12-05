<?php

require '../vendor/autoload.php';

use GuzzleHttp\Client;
use Symfony\Component\DomCrawler\Crawler;

// 请求类型
$type = $_GET['type'];
// $type = $_POST['type'];

if($type !== null){
    if($type == 'modnew'){
        // $id = $_GET['id'];
        // //print_r(json_encode(modSpider($id), JSON_UNESCAPED_UNICODE));
        // header('Content-Type:text/json;charset=utf-8');
        // if ($id != "" || $id != null) {
        // 	$result = modSpider($id);
        // } else {
        // 	$result = "参数错误！";
        // }
        // echo $result;
        echo '提示@请更新脚本！';
    }elseif($type == 'version'){
    	header('Content-Type:text/json;charset=utf-8');
        print_r(json_encode(gameVersion(), JSON_UNESCAPED_UNICODE));
    }elseif($type == 'user'){
        header('Content-Type:text/html;charset=utf-8');
        printf(recordUser());
    }elseif($type == 'checkban'){
        header('Content-Type:text/html;charset=utf-8');
        printf(banUser());
    }elseif($type == 'bt'){
        header('Content-Type:text/html;charset=utf-8');
        print_r(json_encode(getBTToken(), JSON_UNESCAPED_UNICODE));
    }else{
    	header('Content-Type:text/json;charset=utf-8');
    	echo '提示@请更新脚本！';
    }
}else{
    header('This is not the page you are looking for！', true, 404);
    require_once('../404.html');
    exit();
}

function getBTToken(){
    $ipmd5 = $_GET['ipmd5'];
    $datafile = 'plugin.json';
    if (file_exists($datafile)) {
        $userdata = file_get_contents($datafile);
        // 把JSON字符串转成PHP数组
        $userdata = json_decode($userdata, true);
    } else
        $userdata = array();

    if(strlen($ipmd5) == 32) {
        foreach ($userdata as $value) {
			if ($value['ipmd5'] == $ipmd5){
			    $cur_time = time();
			    if ($cur_time > strtotime($value['time'])){
			        $value['outdate'] = "true";
			    }else{
			        $value['outdate'] = "false";
			    }
			    return $value;
			}
		}
	}
	return "not found!";
}

function banUser(){
    $ipmd5 = $_GET['ipmd5'];

    $datafile = 'ban.json';
    if (file_exists($datafile)) {
        $userdata = file_get_contents($datafile);
        // 把JSON字符串转成PHP数组
        $userdata = json_decode($userdata, true);
    } else
        $userdata = array();
    
    print_r($userdata);

    foreach ($userdata as $value) {
	    if ($ipmd5 == $value) {
	        echo "true";
	        break;
	    }
	}
	
	echo false;
}

function recordUser(){
    $ipmd5 = $_GET['ipmd5'];

    $datafile = 'dstscript.json';
    if (file_exists($datafile)) {
        $userdata = file_get_contents($datafile);
        // 把JSON字符串转成PHP数组
        $userdata = json_decode($userdata, true);
    } else
        $userdata = array();

    if(strlen($ipmd5) > 30) {
        $userdata['users'][$ipmd5] = date("Y-m-d H:i:s");
        $userdatain = json_encode($userdata);
        file_put_contents($datafile, $userdatain);
    }
    $usercount = count($userdata['users']);
	// 近一周活跃数量
	$hyusercount = 0;
	$cur_time = date("Y-m-d H:i:s");
	foreach ($userdata as $value) {
		if (is_array($value)) {
			foreach ($value as $timeee) {
				$chazhi = strtotime($cur_time) - strtotime($timeee);
				if ($chazhi < 30 * 24 * 60 * 60) {
					$hyusercount = $hyusercount + 1;
				}
			}
		}
	}
    return '<div style="font-size: 14px;">历史用户数量: ' . $usercount .'。月活跃数量为：' . $hyusercount .'。</div>';
}

function gameVersion(){
    $url = 'https://s3.amazonaws.com/dstbuilds/builds.json';
    $res = file_get_contents($url);
    $dataArray = json_decode($res, true);
    $data = array();
    foreach ($dataArray as $key => $val ) {
        if (is_array ($val)) {
            $val = end($val);
        }
        $data[$key] = $val;
    }
    return $data;
}

function trimAll($str){
    $qian = array(' ','　',"\t","\n", "\r");
    return str_replace($qian, '', $str);
}

function modSpider($id)
{
    //需要爬取的页面
    $url = 'https://steamcommunity.com/sharedfiles/filedetails/?id='.$id;

    //下载网页内容
    $client   = new Client([
        'timeout' => 10,
        'headers' => ['User-Agent' => 'Mozilla/5.0 (compatible; Baiduspider-render/2.0; +http://www.baidu.com/search/spider.html)',
        ],
    ]);
    $response = $client->request('GET', $url)->getBody()->getContents();

    //进行XPath页面数据抽取
    $data    = []; //结构化数据存本数组
    $crawler = new Crawler();
    $crawler->addHtmlContent($response);

    try {
        //MOD名称
        //网页结构中用css选择器用id的比较容易写xpath表达式
        $name = $crawler->filterXPath('//div[@class="workshopItemTitle"][1]')->text();
        // //tags
        // //本xpath表达式会得到多个对象结果,用each方法进行遍历
        // //each是传入的参数是一个闭包,在闭包中使用外部的变量使用use方法,并使用变量指针
        // $crawler->filterXPath('//div[@class="rightDetailsBlock"]/a')->each(function (Crawler $node) use (&$data) {
        //     $data['tags'][] = $node->text();
        // });

        //版本
        $versionString = $crawler->filterXPath('//div[@class="workshopTags"]/a')->text();
        // echo $versionString;
        // echo strlen($versionString)-8;
        // $versionArray = explode(':', $versionString);
        // $version = substr($authorString, 0, strlen($versionString)-8);
        $version = mb_substr($versionString, 8, strlen($versionString)-8, 'utf-8');
        //$data['version'] = $versionArray[1];
        // $version = $versionArray[1];
        // $infoArray = array();
        // $crawler->filterXPath('//div[@class="detailsStatsContainerRight"]/div')->each(function (Crawler $node ) use (&$infoArray) {
        //     $infoArray[] = $node->text();
        // });
        // //大小
        // $data['size'] = $infoArray[0];
        // $data['publish_date'] = $infoArray[1];
        // if ($infoArray[2] !== null) {
        //     $data['update_date'] = $infoArray[2];
        // }else{
        //     $data['update_date'] = $infoArray[1];
        // }

        // $authorString = trimAll($crawler->filterXPath('//div[@class="breadcrumbs"]/a[3]')->text());
        // // $strlen = strlen($authorString);
        // // if(strpos($authorString, 'LastOnline')){
        // //     $tp = strpos($authorString, 'LastOnline');
        // // }else{
        // //     $tp = strpos($authorString, 'Online');
        // // }
        // // $data['author'] = substr($authorString,-$strlen, $tp);
        // $data['author'] =  str_replace("'sWorkshop", "", $authorString);

    } catch (\Exception $e) {
        //$data['error'] = '无法获取MOD信息！';
        $name = 'error';
        $version = 'error';
    }

    return $name.'@'.$version;

}
