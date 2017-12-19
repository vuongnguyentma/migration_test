jQuery ->
  $('#search_tag').keyup ->
    searchText = $('#search_tag').val().toLowerCase()
    $.ajax
      type: 'GET'
      url: '/'
      dataType: 'json'
      data: search: searchText
      success: (data) ->
        $('#content').empty()
        if data
          $.each data, (i, item) ->
            # replace "null" to " "
            if item.issue == null
              item.issue = " "
            if item.expire == null
              item.expire = " "
            if item.dob == null
              item.dob = " "

            html_table = '<tr id=\'passport_' + item.id + '\'>' + '<td>' + item.employeeId + '</td>' + '<td>' + item.name + '</td>' + '<td>' + item.dob + '</td>' + '<td>' + item.email + '</td>' + '<td>' + item.project + '</td>' + '<td>' + item.passport + '</td>' + '<td>' + item.issue + '</td>' + '<td>' + item.expire + '</td>' + '<td class="center-text">' + '<a data-remote="true" href="/passports/' + item.id + '/edit"><i class="fa fa-pencil-square-o padding-right"></i></a>' + '<a data-confirm=\'Are you sure?\' data-remote=\'true\' rel=\'nofollow\' data-method=\'delete\' href=\'/passports/' + item.id + '\'><i class=\'fa fa-trash-o\'></i></a></td>' + '</tr>'
            $('#passport_table').prepend html_table
            return
        return
    return