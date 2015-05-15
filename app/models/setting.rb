class Setting < ActiveRecord::Base

validates_uniqueness_of :name

  def self.get(setting_name)
    setting = Setting.find_by_name(setting_name)
    unless setting
      setting_list = YAML::load(File.open("#{Rails.root}/config/settings.yml"))
      setting = Setting.new
      setting.name = setting_name
      setting.value = setting_list[setting_name]['default']
      setting.save
    end
    setting.value
  end
  
  def self.initialize
    YAML::load(File.open("#{Rails.root}/config/settings.yml")).each do |name, options|
      setting = Setting.new
      setting.name = name
      setting.value = options['default']
      setting.save
    end
        
  end
  
  def self.initialized?
    if Setting.where(is_new: true).count > 0
      false
    else
      true
    end
  end
end