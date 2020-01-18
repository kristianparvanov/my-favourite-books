books = [
	{
		title: 'Then She Was Gone: A Novel',
  	genre: 'Drama',
  	description: 'Ellie Mack was the perfect daughter. She was fifteen, the youngest of three. She was beloved by her parents, friends, and teachers. She and her boyfriend made a teenaged golden couple. She was days away from an idyllic post-exams summer vacation, with her whole life ahead of her.',
  	isbn: '9781501154652',
  	publish_date: '27-Jul-2017'
	},
	{
		title: 'Girl On The Train',
  	genre: 'Mystery',
  	description: 'The story is a first-person narrative told from the point of view of three women: Rachel, Anna, and Megan.',
  	isbn: '9780857523891',
  	publish_date: '13-Jan-2015'
	},
	{
		title: 'One Good Deed',
  	genre: 'Action and Adventure',
  	description: 'It is 1949. When war veteran Aloysius Archer is released from Carderock Prison, he is sent to Poca City on parole with a short list of to do and a much longer list of to do not: do report regularly to his parole officer, do not go to bars, certainly do not drink alcohol and do not ever associate with loose women.',
  	isbn: '9781529027495',
  	publish_date: '9-Jul-2019'
	},
	{
		title: 'Harry Potter and the Philosopher\'s Stone',
  	genre: 'Fantasy',
  	description: 'Harry Potter has been living an ordinary life, constantly abused by his surly and cold aunt and uncle, Vernon and Petunia Dursley and bullied by their spoiled son Dudley since the death of his parents ten years prior.',
  	isbn: '9780747532699',
  	publish_date: '26-Jun-1997'
	},
	{
		title: 'Stardust',
  	genre: 'Fantasy',
  	description: 'On the outskirts of Wall, a small town in rural England, the Faerie Market is held every nine years on the other side of the wall dividing Faerie — a mystical realm of magic — from our world and for which the town of Wall is named.',
  	isbn: '9780380977284',
  	publish_date: '1-Jan-1997'
	}
]

books.each do |book|
  Book.create!(book)
end