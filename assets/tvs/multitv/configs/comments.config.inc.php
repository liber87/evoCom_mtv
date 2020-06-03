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
	'rate' => array(
	'caption' => 'Оценка',
	'type' => 'number'
    ),
	'visible' => array(
	'caption' => 'Показывать',
	'type' => 'checkbox',
	'elements'=>'да==1'
    ),
	);
	$settings['templates'] = array(
    'outerTpl' => '<div class="comments"><ul class="list_none comment_list mt-4">[+wrapper+]</ul></div>
	<style>
	.rating-area {
	overflow: hidden;
	width: 153px;	
	}
	.rating-area:not(:checked) > input {
		display: none;
	}
	.rating-area:not(:checked) > label, .once_star {
		float: right;
		width: 30px;
		padding: 0;
		cursor: pointer;
		font-size: 30px;
		line-height: 30px;
		color: lightgrey;
		text-shadow: 1px 1px #bbb;
	}
	.once_star {float:left;}
	.rating-area:not(:checked) > label:before, .once_star:before {
		content: \'★\';
	}
	.rating-area > input:checked ~ label {
		color: gold;
		text-shadow: 1px 1px #c60;
	}
	.rating-area:not(:checked) > label:hover,
	.rating-area:not(:checked) > label:hover ~ label, .once_star.active {
		color: gold;
	}
	.rating-area > input:checked + label:hover,
	.rating-area > input:checked + label:hover ~ label,
	.rating-area > input:checked ~ label:hover,
	.rating-area > input:checked ~ label:hover ~ label,
	.rating-area > label:hover ~ input:checked ~ label,.once_star.active {
		color: gold;
		text-shadow: 1px 1px goldenrod;
	}
	.rate-area > label:active {
		position: relative;
	}
	</style>
	',
    'rowTpl' => '[[if? &is=`[+visible+]:is:1` &then=`
	<div class="row">		
		<div class="comment_block">
			<div class="rates">
				<span class="once_star [[if? &is=`[+rate+]:gte:1` &then=`active`]]"></span>
				<span class="once_star [[if? &is=`[+rate+]:gte:2` &then=`active`]]"></span>
				<span class="once_star [[if? &is=`[+rate+]:gte:3` &then=`active`]]"></span>
				<span class="once_star [[if? &is=`[+rate+]:gte:4` &then=`active`]]"></span>
				<span class="once_star [[if? &is=`[+rate+]:gte:5` &then=`active`]]"></span>
			</div>
			<div style="clear:both;"></div>
			<p class="customer_meta">
				<span class="review_author">[+name+]</span>
				<span class="comment-date">[+date:date=`%d.%m.%Y %H:%M`+]</span>
			</p>
			<div class="description">
				<p>[+comment+]</p>
			</div>
		</div>
	</div>
	`]]'
	);
