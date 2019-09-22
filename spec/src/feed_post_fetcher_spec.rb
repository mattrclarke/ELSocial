describe FeedPostFetcher do

  subject { described_class.new(current_user: user) }

  let!(:user_1)   { create(:user) }
  let!(:user_2)   { create(:user) }
  let!(:user_3)   { create(:user) }

  let!(:profile_1) { create(:profile, user: user_1, first_name: "ben") }
  let!(:profile_2) { create(:profile, user: user_2, first_name: "ben") }
  let!(:profile_3) { create(:profile, user: user_3) }

  let!(:feed_1) { create(:feed, profile_id: profile_1.id, user_id: user_1.id) }
  let!(:feed_2) { create(:feed, profile_id: profile_1.id, user_id: user_1.id) }
  let!(:feed_3) { create(:feed, profile_id: profile_1.id, user_id: user_1.id) }

  let!(:relationship_1) { create(:relationship, follower_id: follower.id, followed_id: user_2.id) }
  let!(:relationship_2) { create(:relationship, follower_id: follower.id, followed_id: user_3.id) }

  let!(:post_1) { create(:post, user_id: user_2.id, feed_id: feed_1.id ) }
  let!(:post_2) { create(:post, user_id: user_2.id, feed_id: feed_2.id ) }
  let!(:post_3) { create(:post, user_id: user_3.id, feed_id: feed_3.id ) }

  context "when run is called" do
    let!(:user) { user_1 }

    context "and the current user is following other users" do
    let!(:follower) { user_1 }

      it "returns all posts of followed users" do
        results = subject.run
        expect(results.length).to eq 3
      end

      it "formats the results" do
        results = subject.run
        expect(results[0][:first_name]).to eq profile_3.first_name
        expect(results[0][:last_name]).to eq profile_3.last_name
        expect(results[0][:title]).to eq post_3.title
        expect(results[0][:content]).to eq post_3.content
      end
    end

    context "and the current user is NOT following other users" do
      let!(:follower) { user_2 }

        it "returns an empty array" do
          results = subject.run
          expect(results.length).to eq 0
        end
    end

  end
end
