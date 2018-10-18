//<?php
/**
 * SetComments
 *
 * Сохраняем комментарии
 *
 * @category	snippet
 * @internal	@modx_category Comments
 * @internal	@installset base
 * @internal	@overwrite true
 * @internal	@properties {}
 */

if ($FormLister->isSubmitted())
{	
	$params = $FormLister->config->getConfig();
	if ($params['tvField']) $tvField = $params['tvField'];
	else $tvField='comments';

	$tvid = $modx->db->getValue('Select id from '.$modx->getFullTableName('site_tmplvars').' where name="'.$tvField.'"');
	$comment_tv = $modx->db->getValue('Select value from '.$modx->getFullTableName('site_tmplvar_contentvalues').' where tmplvarid='.$tvid.' and contentid='.$modx->documentObject['id']);
	$comment = json_decode($comment_tv,1);	
	$data['visible']=$params['publComment'];
	$data['date'] = time();
	$comment['fieldValue'][] = $data;		
	$insert_comment = json_encode($comment, JSON_UNESCAPED_UNICODE);	
	$modx->db->query('Replace Into '.$modx->getFullTableName('site_tmplvar_contentvalues').' (contentid,tmplvarid,value) VALUES ('.$modx->documentIdentifier.','.$tvid.',"'.$modx->db->escape($insert_comment).'")');		
}
