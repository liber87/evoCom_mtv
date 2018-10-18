//<?php
/**
 * LastComments
 *
 * LastComments
 *
 * @category	snippet
 * @internal	@modx_category Comments
 * @internal	@installset base
 * @internal	@overwrite true
 * @internal	@properties {}
 */

$tvid = $modx->db->getValue('Select id from '.$modx->getFullTableName('site_tmplvars').' where name="comments"');	
if ($_POST['action'])
{	
	$value = $modx->db->getValue('Select `value` from '.$modx->getFullTableName('site_tmplvar_contentvalues').' where tmplvarid='.$tvid.' and `contentid`='.$_POST['doc']);
	$post = json_decode($value, true);		
	
	if ($_POST['action']=='add')
	{
		$post['fieldValue'][$_POST['num']]['visible'] = 1;
	}
	if ($_POST['action']=='remove')
	{
		unset($post['fieldValue'][$_POST['num']]);
	}
	
	$modx->db->query('Update '.$modx->getFullTableName('site_tmplvar_contentvalues').' set value="'.$modx->db->escape(json_encode($post, JSON_UNESCAPED_UNICODE)).'" where tmplvarid='.$tvid.' and contentid='.$_POST['doc']);
	$modx->clearCache();
}
$out='<style>
.review_block{border-radius:0.25rem; border: 1px solid #e3e3e3;     padding: 14px 20px 4px 20px; margin-bottom:20px; position:relative; }
a.copy{position: absolute;right: 25px;top: -12px !important;font-size: 1rem;color: #449d44;display: block;width: 16px;height: 16px;padding: 0; width: 25px !important;
    text-align: center;     background: transparent !important;}
a.remove {position: absolute;top: -12px !important;font-size: 1rem;display: block;height: 16px;padding: 0; right: 10px;    color: #c9302c;}	
.hidden{display:none;}
.showall{cursor:pointer; color:#3481bc; text-decoration:underline;}
</style>
<script>
$(document).ready(function(){
	$(".showall").click(function(e){e.preventDefault;$(this).prev().hide();$(this).next().show();$(this).hide(); return false;});
	$(".copy").click(function(e){e.preventDefault; $(this).closest("form").find(".action").val("add"); $(this).closest("form").submit(); return false;})
	$(".remove").click(function(e){e.preventDefault; 
		if (confirm("Вы уверены?")) { $(this).closest("form").find(".action").val("remove"); $(this).closest("form").submit(); }
	return false;});
});
</script>
';
$res = $modx->db->query('Select `contentid`,`value` from '.$modx->getFullTableName('site_tmplvar_contentvalues').' where tmplvarid='.$tvid.' and value like \'%"visible":""%\'');	
while ($row = $modx->db->getRow($res))
{	
	$o=1;
	$post = json_decode($row['value'], true);
	if (count($post))
	{
		foreach($post['fieldValue'] as $k => $p)
		{
			if (!$p['visible'])
			{
				$out.='<form method="post" action="">		
				<div class="review_block">
				<a href="#" class="copy" title="Добавить"><i class="fa fa-plus-circle"></i></a>
				<a href="#" class="remove" title="Удалить"><i class="fa  fa-minus-circle"></i></a>				
				<input type="hidden" name="doc" value="'.$row['contentid'].'">
				<input type="hidden" name="num" value="'.$k.'">
				<input type="hidden" name="action" value="" class="action">
				
				';
				$out.='<p><a href="index.php?a=27&id='.$row['contentid'].'" target="_blank">'.$modx->db->getValue('Select pagetitle from '.$modx->getFullTableName('site_content').' where id='.$row['contentid']).'</a></p>';
				$text = strip_tags($p['comment']);				
				if (strlen($p['review'])>300) 
				{
					$text =	substr($text, 0, 300).'<span>... </span><a class="showall" href="#">развернуть</a><span class="hidden">'.substr($text, 300).'</span>';
				}				
				$out.='<p><i>'.$p['date'].'</i> '.$text.'</p>';
				$out.='</div></form>';
				
			}
		}
	}
	
	
}
if ($o) return $out;
	else return 'Неопубликованных комментарие нет';
