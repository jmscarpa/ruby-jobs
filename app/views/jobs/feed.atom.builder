atom_feed :language => 'pr-BR' do |feed|
  feed.title @title
  feed.updated @updated

  @job.each do |item|
    next if item.updated_at.blank?

    feed.entry( item ) do |entry|
      entry.url job_url(item)
      entry.title item.title
      entry.description item.description, :type => 'html'

      # the strftime is needed to work with Google Reader.
      entry.updated(item.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ"))

      entry.author do |author|
        author.name entry.email
      end
    end
  end
end
