<!-- Card -->
<div class="card">

  <!-- Card image -->
  <div class="view overlay">
    <img class="card-img-top" [xfvalue_images]
    <a>
      <div class="mask rgba-white-slight"></div>
    </a>
  </div>

  <!-- Button -->
  [full-link]<button class="btn-floating btn-action ml-auto mr-4 mdb-color lighten-3 float-right"><i class="fa fa-external-link" aria-hidden="true"></i></button>[/full-link]

  <!-- Card content -->
  <div class="card-body">

    <!-- Title -->
    <h4 class="card-title">[full-link]{title limit="80"}[/full-link]</h4>
    <hr>
    <!-- Text -->
    <p class="card-text">{short-story}</p>

  </div>

  <!-- Card footer -->
  <div class="rounded-bottom mdb-color lighten-3 text-center pt-3">
    <ul class="list-unstyled list-inline font-small">
      <li class="list-inline-item pr-2 white-text"><i class="fa fa-user" aria-hidden="true"></i> {author}</li>
      <li class="list-inline-item pr-2 white-text"><i class="fa fa-clock-o pr-1" aria-hidden="true"></i> {date}</li>
      <li class="list-inline-item pr-2 white-text"><i class="fa fa-comments-o" aria-hidden="true"></i> [com-link]{comments-num}[/com-link]</li>
      <li class="list-inline-item pr-2 white-text"><i class="fa fa-eye" aria-hidden="true"></i> {views}</li>
    </ul>
  </div>
</div>
<!-- Card -->
<br>
