<div id="user" class="users-wrapper">
    <div class="users-inner">
      <div class="user-head">
        <h1>{{site.data.user.title}}</h1>
        <p>{{site.data.user.desc}}</p>
      </div>
      {% for row in site.data.user.items %}
      <div class="row">
        {% for item in row %}
            <div class="col">
                <div class="user-desc">
                    <h1>{{item.title}}</h1>
                    <p>{{item.desc}}</p>
                </div>
                {% if item.style %}
                <img src="{{ url_for(item.src) }}" style="{{item.style}}"/>
                {% else %}
                <img src="{{ url_for(item.src) }}"/>
                 {% endif %}
            </div>
        {% endfor %}
      </div>
      {% endfor %}
    </div>
  </div>