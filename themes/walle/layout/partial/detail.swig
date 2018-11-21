<div id="detail" class="wrapper">
    <div class="inner">
      <div class="detail-head">
        <h1>{{site.data.detail.title}}</h1>
      </div>
      <div class="detail-body">
        <div class="detail-list">
          {% for row in site.data.detail.list.left %}
            <div class="detail-item">
              <i class="{{row.icon}}"></i>
              <h1>{{row.title}}</h1>
              <p>{{row.desc}}</P>
            </div>
          {% endfor %}
        </div>
        <div class="detail-content">
          <img src="{{ url_for(site.data.detail.src) }}"/>
        </div>
        <div class="detail-list">
          {% for row in site.data.detail.list.right %}
            <div class="detail-item">
              <i class="{{row.icon}}"></i>
              <h1>{{row.title}}</h1>
              <p>{{row.desc}}</P>
            </div>
          {% endfor %}
        </div>
      </div>
    </div>
  </div>