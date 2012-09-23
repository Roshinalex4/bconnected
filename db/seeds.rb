# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name:'Chicago' ) Language.create (name:'Copenhagen' }])

Language.delete_all  
languages = Language.create([
  { :code => "in_ID", :name => "Bahasa Indonesia" },
  { :code => "cs_CZ", :name => "Czech" },
  { :code => "nl_NL", :name => "Dutch" }, 
  { :code => "en_US", :name => "English" }, 
  { :code => "fr_FR", :name => "French" }, 
  { :code => "de_DE", :name => "German" }, 
  { :code => "it_IT", :name => "Italian" }, 
  { :code => "ja_JP", :name => "Japanese" }, 
  { :code => "ko_KR", :name => "Korean" }, 
  { :code => "ms_MY", :name => "Malay" }, 
  { :code => "no_NO", :name => "Norwegian" }, 
  { :code => "pl_PL", :name => "Polish" }, 
  { :code => "pt_BR", :name => "Portuguese" }, 
  { :code => "ro_RO", :name => "Romanian" }, 
  { :code => "ru_RU", :name => "Russian" }, 
  { :code => "es_ES", :name => "Spanish" }, 
  { :code => "sv_SE", :name => "Swedish" }, 
  { :code => "tr_TR", :name => "Turkish" }, 
  { :code => "sq_AL", :name => "Albanian" }, 
  { :code => "hy_AM", :name => "Armenian" }, 
  { :code => "bs_BA", :name => "Bosnian" }, 
  { :code => "my_MM", :name => "Burmese (Myanmar }," }, 
  { :code => "zh_CN", :name => "Chinese (Simplified }," }, 
  { :code => "zh_TW", :name => "Chinese (Traditional }," }, 
  { :code => "hr_HR", :name => "Croatian" }, 
  { :code => "da_DK", :name => "Danish" }, 
  { :code => "fi_FI", :name => "Finnish" }, 
  { :code => "el_GR", :name => "Greek" }, 
  { :code => "hi_IN", :name => "Hindi" }, 
  { :code => "hu_HU", :name => "Hungarian" }, 
  { :code => "is_IS", :name => "Icelandic" }, 
  { :code => "jv_JV", :name => "Javanese" }, 
  { :code => "kn_IN", :name => "Kannada" }, 
  { :code => "lv_LV", :name => "Latvian" }, 
  { :code => "lt_LT", :name => "Lithuanian" }, 
  { :code => "ml_IN", :name => "Malayalam" }, 
  { :code => "sr_BA", :name => "Serbian" }, 
  { :code => "sk_SK", :name => "Slovak" }, 
  { :code => "tl_PH", :name => "Tagalog" }, 
  { :code => "ta_IN", :name => "Tamil" }, 
  { :code => "te_IN", :name => "Telugu" }, 
  { :code => "th_TH", :name => "Thai" }, 
  { :code => "uk_UA", :name => "Ukrainian" }, 
  { :code => "vi_VN", :name => "Vietnamese" }
])
