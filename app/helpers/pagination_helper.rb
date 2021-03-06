# Based on https://gist.github.com/purcell/1205828
require 'will_paginate/view_helpers/action_view'

module PaginationHelper

  class BootstrapLinkRenderer < ::WillPaginate::ActionView::LinkRenderer
    protected

    def html_container(html)
      tag :div, tag(:ul, html, :class => "pagination"), container_attributes
    end

    def page_number(page)
      tag :li, link(page, page, :rel => rel_value(page)), :class => ('active' if page == current_page)
    end

    def gap
      tag :li, link('&hellip;'.html_safe, '#'), :class => 'disabled'
    end

    def previous_or_next_page(page, text, classname)
      tag :li, link(text, page || '#'), :class => [classname[0..3], classname, ('disabled' unless page)].join(' ')
    end
  end

  def bs_paginate(pages)
    will_paginate(pages, :class => 'pagination', :inner_window => 2, :outer_window => 0, :renderer => BootstrapLinkRenderer)
  end

  def display_page_entries_info(collection)
    parts = page_entries_info(collection).split("#")
    string = [parts[0], number_with_delimiter(parts[1]), parts[2]].to_s.html_safe
  end

end
