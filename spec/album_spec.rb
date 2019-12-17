require 'rspec'
require 'album'


describe '#Album' do
  before(:each) do
    Album.clear()
  end

  describe('.all') do
    it('returns an empty array when there are no albums') do
      expect(Album.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves an album') do
      album = Album.new('Giant Steps', nil, '1960', 'Jazz', 'John Coltrane')
      album.save()
      album2 = Album.new('Blue', nil, "1984", "Rock", "N/A")
      album2.save()
      expect(Album.all).to(eq([album, album2]))
    end
  end

  describe('#==') do
    it('is the same album if it has the same attributes as another album') do
      album = Album.new('Giant Steps', nil, '1960', 'Jazz', 'John Coltrane')
      album2 = Album.new('Giant Steps', nil, '1960', 'Jazz', 'John Coltrane')
      expect(album).to(eq(album2))
    end
  end

  describe('.clear') do
    it('clears all albums') do
      album = Album.new('Giant Steps', nil, '1960', 'Jazz', 'John Coltrane')
      album.save()
      album2 = Album.new('Blue', nil, "1984", "Rock", "N/A")
      album2.save()
      Album.clear()
      expect(Album.all).to(eq([]))
    end
  end

  describe('.find') do
    it('finds an album by id') do
      album = Album.new('Giant Steps', nil, '1960', 'Jazz', 'John Coltrane')
      album.save()
      album2 = Album.new('Blue', nil, "1984", "Rock", "N/A")
      album2.save()
      expect(Album.find(album.id)).to(eq(album))
    end
  end

  describe('#update') do
    it('updates an album by id') do
      album = Album.new('Giant Steps', nil, '1960', 'Jazz', 'John Coltrane')
      album.save()
      album.update('A Love Supreme', '1970', 'Jazz', 'John Coltrane')
      expect(album.name).to(eq('A Love Supreme'))
      expect(album.year).to(eq('1970'))
    end
  end

  describe('#delete') do
    it('deletes an album by id') do
      album = Album.new('Giant Steps', nil, '1960', 'Jazz', 'John Coltrane')
      album.save()
      album2 = Album.new('Blue', nil, "1984", "Rock", "N/A")
      album2.save()
      album.delete()
      expect(Album.all).to(eq([album2]))
    end
  end

  describe('#search') do
    it('searches for albums by title') do
      album = Album.new('Giant Steps', nil, '1960', 'Jazz', 'John Coltrane')
      album.save()
      album2 = Album.new('Giant Steps 2', nil, '1960', 'Jazz', 'John Coltrane')
      album2.save()
      search_term = 'steps'
      expect(Album.search(search_term)).to(eq([album, album2]))
      expect(album2.name).to(eq("Giant Steps 2"))
    end
  end
end
