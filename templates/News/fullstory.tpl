<!-- Card -->
<div class="card">

  <!-- Card image -->
  <div class="view overlay">
    <img class="card-img-top" [xfvalue_images]
    <a>
      <div class="mask rgba-white-slight"></div>
    </a>
  </div>

  <!-- Card content -->
  <div class="card-body">

    <!-- Title -->
    <h4 class="card-title">{title limit="80"}</h4>
    <h6 class="card-title">Категория: {link-category}</h6>
    <hr>
    <!-- Text -->
    <p class="card-text">{full-story}</p>

  </div>

  <div class="rounded-bottom mdb-color lighten-3 text-center pt-3">
    <ul class="list-unstyled list-inline font-small">
      <li class="list-inline-item pr-2 white-text"><i class="fa fa-user" aria-hidden="true"></i> {author}</li>
      <li class="list-inline-item pr-2 white-text"><i class="fa fa-clock-o pr-1"></i> {date}</li>
      <li class="list-inline-item pr-2 white-text"><i class="fa fa-comments-o pr-1"></i> {comments-num}</li>
      <li class="list-inline-item pr-2 white-text"><i class="fa fa-eye" aria-hidden="true"></i> {views}</li>
    </ul>
  </div>

</div>
<!-- Card -->
<br>
<div class="card">
    <div class="card-body">
        [comments]<h4 class="card-title">Отзывы пользователей</4>[/comments]
	{comments}
    </div>
</div>
<div class="card">
    <div class="card-body">
        {addcomments}
	    {navigation}
    </div>
</div>