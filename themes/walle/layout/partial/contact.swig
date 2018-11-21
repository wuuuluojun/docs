<div id="contact" class="wrapper">
    <div class="inner">
      <div class="contact-head">
        <h1>{{site.data.contact.title}}</h1>
      </div>
      <div class="contact-body">
      {% for row in site.data.contact.list %}
        <div class="contact-item">
            <h1>{{row.title}}</h1>
            <img src="{{ url_for(row.src) }}"/>
        </div>
      {% endfor %}
      </div>
    </div>
  </div>