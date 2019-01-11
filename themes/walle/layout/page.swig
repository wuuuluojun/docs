<div id="content-wrap">
  <div id="content" class="wrapper">
    <div id="content-inner">
      <article class="article-container" itemscope itemtype="http://schema.org/Article">
        <div class="article-inner">
          <div class="article">
            <div class="inner">
              <header class="article-header">
                <h1 class="article-title" itemprop="name">{{ page.title }}</h1>
                <a href="{{ raw_link(page.source) }}" class="article-edit-link" title="{{ __('page.improve') }}"><i class="fa fa-pencil"></i> {{ __('page.improve') }}</a>
              </header>
              <div class="article-content" itemprop="articleBody" data-swiftype-index="true">
                {{ page_anchor(page.content) }}
              </div>
              <footer class="article-footer">
                 {% if config.donate %}
                 <div class="donate"><i class="fa fa-usd"></i><a href="{{location.host+'/donate.html'}}">打赏</a> <span>或者</span> <a style="font-size: 18px;" href="https://github.com/meolu/walle-web" target="_blank">star</a></div>
                 {% endif %}
                <time class="article-footer-updated" datetime="{{ date_xml(page.updated) }}" itemprop="dateModified">{{ __('page.last_updated', date(page.updated)) }}</time>
                {{ page_nav() }}
              </footer>
            </div>
          </div>
          <aside id="article-toc" role="navigation">
            <div id="article-toc-inner">
              <strong class="sidebar-title">{{ __('page.contents') }}</strong>
              {{ toc(page.content, {list_number: false}) }}
              <a href="#" id="article-toc-top">{{ __('page.back_to_top') }}</a>
            </div>
          </aside>
        </div>
      </article>
      {{ partial('partial/sidebar') }}
    </div>
  </div>
</div>