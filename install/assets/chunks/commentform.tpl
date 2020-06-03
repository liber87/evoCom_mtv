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
			<div class="form-group col-sm-12">
				<div class="rating-area">
					<input type="radio" id="star-5" name="rate" value="5">
					<label for="star-5" title="Оценка «5»"></label>	
					<input type="radio" id="star-4" name="rate" value="4">
					<label for="star-4" title="Оценка «4»"></label>    
					<input type="radio" id="star-3" name="rate" value="3">
					<label for="star-3" title="Оценка «3»"></label>  
					<input type="radio" id="star-2" name="rate" value="2">
					<label for="star-2" title="Оценка «2»"></label>    
					<input type="radio" id="star-1" name="rate" value="1">
					<label for="star-1" title="Оценка «1»"></label>
				</div>
			</div>
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

