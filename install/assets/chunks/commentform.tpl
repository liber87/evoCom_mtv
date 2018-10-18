/**
 * commentForm
 *
 * sendForm
 *
 * @category	chunk
 * @internal	@modx_category Comments
 * @internal	@installset base
 * @internal	@overwrite true
 */
<div class="title2">Оставить комментарий</div>

	<form method="post">
		<input type="hidden" name="formid" value="sendComment">
		<div class="row">
			<div class="col-sm-12">
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<input type="text" class="form-control" name="name" placeholder="Ваше имя" required>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<input type="text" class="form-control" name="email" placeholder="Адрес эл. почты" required>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<textarea class="form-control" rows="9" placeholder="Ваш отзыв" name="comment" required></textarea>
				</div>
			</div>
		</div>
		<button type="submit" class="btn btn-success btn-block">Отправить</button>
	</form>

