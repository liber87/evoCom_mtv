//<?php
/**
 * LastComments
 *
 * LastComments
 *
 * @category    plugin
 * @internal    @events OnManagerWelcomeHome
 * @internal    @modx_category Comments
 * @internal    @properties 
 * @internal    @disabled 0
 * @internal    @installset base
 */
$e = &$modx->Event;
switch($e->name){
    case 'OnManagerWelcomeHome':                       
       		
		$widgets['reviews'] = array(
            'menuindex' =>'0',
            'id' => 'reviews',
            'cols' => 'col-sm-12',
            'icon' => 'fa-comments',
            'title' => 'Неопубликованные отзывы',
            'body' => '<div class="card-body">'.$modx->runSnippet('LastComments').'</div>',
            'hide'=>'0'
        );
        $e->output(serialize($widgets));
    break;
}

