/**
 * commentList
 *
 * Вызов комментариев
 *
 * @category	chunk
 * @internal	@modx_category Comments
 * @internal	@installset base
 * @internal	@overwrite true
 */
<div style="margin:30px 0;">
[!multiTV?
&tvName=`comments`
&docid=`[*id*]`
&display=`5`
&offset=`0`
&noResults=``
!]
</div>

[!FormLister?
&formid=`sendComment`
&formTpl=`commentForm`
&reportTpl=`commentReport`
&to=`alexey@liber.pro`
&subject=`На сайте [(site_name)] оставлен комментарий`
&prepare=`checkSpamTimeFL,SetComments`
&protectSubmit=`0`
&tvField=`comments` //ТВ с комментариями
&publComment=`1` //Публиковать по умолчанию
!]
