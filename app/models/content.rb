class Content < ApplicationRecord
	extend FriendlyId
	friendly_id :titolo, use: :slugged
	belongs_to :user 
	has_many :sales
	has_attached_file :cover, styles: { medium: "300>", thumb: "100>" }
    validates_attachment_content_type :cover, content_type: /\Afile\/.*\z/


    has_attached_file :allegato
    validates_attachment_content_type :allegato, :content_type => [ /^image\/(png|gif|jpeg)/,'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document','application/mspowerpoint','application/vnd.ms-powerpoint','application/vnd.openxmlformats-officedocument.presentationml.presentation', 'application/pdf', 'application/msexcel','application/vnd.ms-excel','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','audio/mpeg', 'audio/mp3' ]

    validates :titolo, :descrizione, :price, presence: true
    validates :price, numericality: { greater_than: 49 }


end
