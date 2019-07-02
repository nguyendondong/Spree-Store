$(document).ready ->
  if $("#blog_entry_taxon_ids").length > 0
    $("#blog_entry_taxon_ids").select2
      placeholder: Spree.translations.taxon_placeholder
      multiple: true
      initSelection: (element, callback) ->
        url = Spree.url(Spree.routes.taxons_search,
          ids: element.val()
        )
        $.getJSON url, null, (data) ->
          callback data["taxons"]


      ajax:
        url: Spree.routes.taxons_search
        datatype: "json"
        data: (term, page) ->
          per_page: 50
          page: page
          without_children: true
          q:
            name_cont: term

        results: (data, page) ->
          more = page < data.pages
          results: data["taxons"]
          more: more

      formatResult: (taxon) ->
        taxon.pretty_name

      formatSelection: (taxon) ->
        taxon.pretty_name
