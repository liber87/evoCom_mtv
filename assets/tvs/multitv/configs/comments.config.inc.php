<?php
	$settings['display'] = 'vertical';
	$settings['fields'] = array(
    'name' => array(
	'caption' => 'Имя',
	'type' => 'text'
    ),
    'email' => array(
	'caption' => 'email',
	'type' => 'text'
    ),	
	'comment' => array(
	'caption' => 'Комментарий',
	'type' => 'textarea'
    ),
	'date' => array(
	'caption' => 'Дата',
	'type' => 'date'
    ),
	'visible' => array(
	'caption' => 'Показывать',
	'type' => 'checkbox',
	'elements'=>'да==1'
    ),
	);
	$settings['templates'] = array(
    'outerTpl' => '<div class="feedback_wrap">[+wrapper+]</div>',
    'rowTpl' => '[[if? &is=`[+visible+]:is:1` &then=`
	<div class="row">
	<div class="col-xs-12" style="margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #39C7BB;">
		<div class="name"><b>[+name+]</b> ([+date:date=`%d.%m.%Y %H:%M`+])</div>
		<div class="comment">[+comment+]</div>
		</div>
	</div>
	`]]'
	);
