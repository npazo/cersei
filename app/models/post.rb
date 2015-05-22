class Post < ActiveRecord::Base
  has_many :posts_medium
  has_many :media, :through => :posts_medium
  belongs_to :user
  validates :title, presence: true

  def processed_body(truncated = false)
    
    if truncated
      @return = self.body.split('%%more%%').first
    else
      @return = self.body.sub('%%more%%', '')
    end
    
    self.body.scan(/%%media=\d+%%/).each do |s|    
      #@replace = self.body[/%%media=\d+%%/].split('=').last.sub("%%", "")
      @replace = s.split('=').last.sub("%%", "")  # separate out the id of the media
      #@return = self.body.gsub(/%%media=\d+%%/, Medium.find(@replace).m.to_s);
      @return = @return.gsub(s, Medium.find(@replace).m.to_s);
    end
    return @return.html_safe
  end

  def date_short
    return date.strftime("%b %-e %Y")
  end

  def has_more?
    if self.body.include?('%%more%%')
      true
    else
      false
    end
  end

end

