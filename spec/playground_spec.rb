require 'spec_helper'

describe 'Playground' do
  let(:meeting) do
    LeanCoffee::Domain::Meetings::Meeting.example(
      participants: [chris, angie]
    )
  end

  let(:chris) do
    LeanCoffee::Domain::Meetings::Participant.build(
      topic_votes: [],
      user: LeanCoffee::Domain::Users::User.build(name: 'Chris').tap(&:save),
      remaining_votes: 5
    )
  end

  let(:angie) do
    LeanCoffee::Domain::Meetings::Participant.build(
      topic_votes: [],
      user: LeanCoffee::Domain::Users::User.build(name: 'Angie').tap(&:save),
      remaining_votes: 5
    )
  end

  let(:topics) {
    {
      lean_coffee: LeanCoffee::Domain::Meetings::Topic.default(
        value: 'lean coffee', timebox: LeanCoffee::Domain::Meetings::Timebox.zeroed
      ),
      retrospective: LeanCoffee::Domain::Meetings::Topic.default(
        value: 'retrospective', timebox: LeanCoffee::Domain::Meetings::Timebox.zeroed
      )
    }
  }

  it 'Play a game' do
    # Collecting #######################

    meeting.start_collecting!
    meeting.add_topic!(topics[:lean_coffee])
    meeting.add_topic!(topics[:retrospective])
    meeting.wait_for_next_phase!
    expect(meeting.phase).to eq :waiting

    # Voting for Topics #######################

    meeting.start_voting!

    expect(meeting.phase).to eq :voting

    meeting.vote!(topic: topics[:lean_coffee], participant: chris)
    meeting.vote!(topic: topics[:retrospective], participant: chris)
    meeting.vote!(topic: topics[:retrospective], participant: chris)

    expect(topics[:lean_coffee].votes).to eq 1
    expect(topics[:retrospective].votes).to eq 2

    # Ordering #######################

    meeting.start_ordering!

    meeting.order_by_votes!

    expect(meeting.discussion.topics.first).to eq topics[:retrospective]

    meeting.move_topic_to_top!(topics[:lean_coffee])

    expect(meeting.discussion.topics.first).to eq(topics[:lean_coffee])

    meeting.move_topic_to_bottom!(topics[:lean_coffee])

    expect(meeting.discussion.topics.first).to eq(topics[:retrospective])

    # Discussing #######################

    meeting.start_discussing!
    meeting.discuss_next_topic!

    expect(meeting.discussion.discussing).to eq(topics[:retrospective])
    expect(meeting.phase).to eq :discussing_topic
    
    meeting.wait_for_extension_vote!

    expect(meeting.phase).to eq :waiting_for_extension_vote

    meeting.discuss_next_topic!
    
    expect(meeting.discussion.discussing).to eq(topics[:lean_coffee])


    # Keep Talking #######################

    meeting.wait_for_extension_vote!

    meeting.vote_to_keep_talking!(participant: angie)
    meeting.vote_to_stop_talking!(participant: chris)

    meeting.keep_talking!
    meeting.wait_for_extension_vote!

    # Stop Talking #######################

    meeting.vote_to_stop_talking!(participant: chris)
    meeting.vote_to_stop_talking!(participant: angie)
    meeting.discuss_next_topic!

    meeting.save
  end

  it 'has a build factory' do
    expect(LeanCoffee::Domain::Meetings::Meeting.build(
      discussion: {},
      participants: [],
      timebox: LeanCoffee::Domain::Meetings::Timebox.zeroed
    ).timebox.voting_duration).to eq 0
  end
end
