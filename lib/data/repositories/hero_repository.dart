import '../models/hero_model.dart';
import '../../core/constants/enums.dart';

class HeroRepository {
  static final List<HeroModel> allHeroes = [
    // 1. Fanny
    _h(
        'fanny',
        1,
        'Fanny',
        HeroRole.assassin,
        [HeroLane.jungle],
        'Chase/Reap',
        'High mobility wall-spam master.',
        'Wait for enemy CC, then dive.',
        const HeroStats(
            damage: 10,
            durability: 2,
            crowdControl: 4,
            mobility: 10,
            difficulty: 9.5),
        55,
        c: ['khufra', 'saber', 'eudora', 'franco', 'chou', 'nana'],
        s: ['layla', 'miya', 'eudora', 'hanabi']),

    // 2. Layla
    _h(
        'layla',
        2,
        'Layla',
        HeroRole.marksman,
        [HeroLane.gold],
        'Range',
        'Extreme late-game damage.',
        'Stay behind tanks; maximize range.',
        const HeroStats(
            damage: 9.5,
            durability: 1.5,
            crowdControl: 3,
            mobility: 1,
            difficulty: 2),
        48,
        c: [
          'fanny',
          'ling',
          'lancelot',
          'gusion',
          'khufra',
          'saber',
          'jawhead'
        ],
        s: ['balmond', 'tigreal', 'estes']),

    // 3. Tigreal
    _h(
        'tigreal',
        3,
        'Tigreal',
        HeroRole.tank,
        [HeroLane.roam],
        'Control',
        'King of team initiation.',
        'Flicker + Ult combo for huge setups.',
        const HeroStats(
            damage: 3,
            durability: 9.5,
            crowdControl: 10,
            mobility: 4,
            difficulty: 3),
        52,
        c: ['diggie', 'valir', 'akai', 'lunox'],
        s: ['odette', 'pharsa', 'guinevere']),

    // 4. Gusion
    _h(
        'gusion',
        4,
        'Gusion',
        HeroRole.assassin,
        [HeroLane.jungle, HeroLane.mid],
        'Burst',
        'Magic assassin.',
        'Target the enemy marksman. Fast combo.',
        const HeroStats(
            damage: 10,
            durability: 3,
            crowdControl: 2,
            mobility: 9,
            difficulty: 8.5),
        53,
        c: ['ruby', 'khufra', 'minisitthar', 'chou', 'nana'],
        s: ['layla', 'lesley', 'miya', 'eudora']),

    // 5. Nana
    _h(
        'nana',
        5,
        'Nana',
        HeroRole.mage,
        [HeroLane.mid, HeroLane.roam],
        'Poke',
        'The Molina disruptor.',
        'Place Molina in bushes; Ult in crowds.',
        const HeroStats(
            damage: 7.5,
            durability: 4,
            crowdControl: 9,
            mobility: 5,
            difficulty: 3),
        50,
        c: ['helcurt', 'natalia', 'saber', 'ling'],
        s: ['fanny', 'ling', 'gusion', 'chou']),

    // 6. Alucard
    _h(
        'alucard',
        6,
        'Alucard',
        HeroRole.fighter,
        [HeroLane.jungle, HeroLane.exp],
        'Lifesteal',
        'King of lifesteal.',
        'Wait for CC use before jumping in.',
        const HeroStats(
            damage: 8.5,
            durability: 7,
            crowdControl: 2,
            mobility: 7.5,
            difficulty: 4),
        49,
        c: ['baxia', 'karrie', 'franco', 'khufra'],
        s: ['sun', 'gord', 'layla']),

    // 7. Franco
    _h(
        'franco',
        7,
        'Franco',
        HeroRole.tank,
        [HeroLane.roam],
        'Hook',
        'Hook expert.',
        'Hook the core and Suppress immediately.',
        const HeroStats(
            damage: 3,
            durability: 8,
            crowdControl: 10,
            mobility: 5,
            difficulty: 7),
        51,
        c: ['selena', 'kadita', 'hylos', 'diggie'],
        s: ['fanny', 'ling', 'gusion', 'lancelot']),

    // 8. Estes
    _h(
        'estes',
        8,
        'Estes',
        HeroRole.support,
        [HeroLane.roam],
        'Heal',
        'Ultimate healer.',
        'Stay in the middle of your team.',
        const HeroStats(
            damage: 1,
            durability: 5,
            crowdControl: 4,
            mobility: 3,
            difficulty: 3.5),
        54,
        c: ['luoyi', 'baxia', 'atlas', 'khaleed'],
        s: ['rafaela', 'angela', 'nana']),

    // 9. Chou
    _h(
        'chou',
        9,
        'Chou',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.roam],
        'Control',
        'Kung-fu master.',
        'Kick the carry toward your team.',
        const HeroStats(
            damage: 7,
            durability: 7.5,
            crowdControl: 8.5,
            mobility: 9.5,
            difficulty: 8),
        52,
        c: ['masha', 'phoveus', 'khufra', 'nana'],
        s: ['lancelot', 'fanny', 'gusion', 'selena']),

    // 10. Ling
    _h(
        'ling',
        10,
        'Ling',
        HeroRole.assassin,
        [HeroLane.jungle],
        'Chase',
        'Wall walker.',
        'Dive in when the enemy is low on HP.',
        const HeroStats(
            damage: 9.5,
            durability: 3,
            crowdControl: 3.5,
            mobility: 10,
            difficulty: 8.5),
        53,
        c: ['kaja', 'khufra', 'saber', 'franco', 'eudora', 'nana'],
        s: ['layla', 'hanabi', 'miya']),

    // 11. Balmond
    _h(
        'balmond',
        11,
        'Balmond',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.jungle],
        'Regen',
        'Durable executioner.',
        'Spin in crowd. Use Ult for secure.',
        const HeroStats(
            damage: 7.5,
            durability: 8.5,
            crowdControl: 3,
            mobility: 5,
            difficulty: 3),
        51,
        c: ['karrie', 'valir', 'lunox', 'baxia'],
        s: ['layla', 'miya', 'hanabi']),

    // 12. Eudora
    _h(
        'eudora',
        12,
        'Eudora',
        HeroRole.mage,
        [HeroLane.mid],
        'Burst',
        'Instant burst queen.',
        'Hide in bushes. Skill 2 -> Ult -> Skill 1.',
        const HeroStats(
            damage: 10,
            durability: 2,
            crowdControl: 8,
            mobility: 3,
            difficulty: 3.5),
        50,
        c: ['lancelot', 'benedetta', 'chou', 'ling'],
        s: ['fanny', 'ling', 'gord', 'layla']),

    // 13. Khufra
    _h(
        'khufra',
        13,
        'Khufra',
        HeroRole.tank,
        [HeroLane.roam],
        'Anti-Dash',
        'The dash stopper.',
        'S1 from bush. S2 to stop dashers.',
        const HeroStats(
            damage: 4,
            durability: 9,
            crowdControl: 10,
            mobility: 7,
            difficulty: 7.5),
        53,
        c: ['valir', 'nana', 'diggie', 'karrie'],
        s: ['fanny', 'ling', 'lancelot', 'gusion', 'layla']),

    // 14. Miya
    _h(
        'miya',
        14,
        'Miya',
        HeroRole.marksman,
        [HeroLane.gold],
        'Speed',
        'Late-game carry.',
        'Use Ult to reposition and surprise.',
        const HeroStats(
            damage: 9,
            durability: 2.5,
            crowdControl: 4,
            mobility: 7,
            difficulty: 3),
        49,
        c: ['hayabusa', 'saber', 'eudora', 'ling', 'fanny'],
        s: ['tigreal', 'estes', 'balmond']),

    // 15. Lancelot
    _h(
        'lancelot',
        15,
        'Lancelot',
        HeroRole.assassin,
        [HeroLane.jungle],
        'Chase',
        'Invincibility frames.',
        'Dash through targets to reset S1.',
        const HeroStats(
            damage: 9,
            durability: 3.5,
            crowdControl: 2,
            mobility: 10,
            difficulty: 8),
        52,
        c: ['khufra', 'minisitthar', 'phoveus', 'ruby'],
        s: ['layla', 'eudora', 'odette', 'nana']),

    // 16. Valir
    _h(
        'valir',
        16,
        'Valir',
        HeroRole.mage,
        [HeroLane.mid, HeroLane.roam],
        'Guard',
        'Anti-tank mage.',
        'S2 to push back. Spam S1 to reset.',
        const HeroStats(
            damage: 8,
            durability: 4,
            crowdControl: 9,
            mobility: 4,
            difficulty: 4.5),
        51,
        c: ['lancelot', 'gusion', 'lesley', 'ling'],
        s: ['tigreal', 'balmond', 'khufra', 'hylos']),

    // 17. Karrie
    _h(
        'karrie',
        17,
        'Karrie',
        HeroRole.marksman,
        [HeroLane.gold, HeroLane.jungle],
        'True DMG',
        'Tank killer.',
        'Focus nearest target. Kite with dash.',
        const HeroStats(
            damage: 9.5,
            durability: 3,
            crowdControl: 2,
            mobility: 8,
            difficulty: 6.5),
        54,
        c: ['lolita', 'natalia', 'saber', 'eudora'],
        s: ['tigreal', 'hylos', 'balmond', 'baxia', 'alucard']),

    // 18. Selena
    _h(
        'selena',
        18,
        'Selena',
        HeroRole.assassin,
        [HeroLane.mid, HeroLane.roam],
        'Stun',
        'Long-range stun.',
        'Arrow from afar. Traps for vision.',
        const HeroStats(
            damage: 9,
            durability: 2.5,
            crowdControl: 10,
            mobility: 8.5,
            difficulty: 8.5),
        50,
        c: ['kagura', 'wanwan', 'diggie', 'chou'],
        s: ['layla', 'gord', 'estes', 'franco']),

    // 19. Jawhead
    _h(
        'jawhead',
        19,
        'Jawhead',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.jungle],
        'Throw',
        'Pick-off master.',
        'Throw back to team.',
        const HeroStats(
            damage: 8.5,
            durability: 7.5,
            crowdControl: 8,
            mobility: 7.5,
            difficulty: 5),
        51,
        c: ['nana', 'karrie', 'valir', 'tigreal'],
        s: ['layla', 'hanabi', 'gord', 'eudora']),

    // 20. Granger
    _h(
        'granger',
        20,
        'Granger',
        HeroRole.marksman,
        [HeroLane.jungle, HeroLane.gold],
        'Burst',
        'Bullet burst.',
        'Poke with S1. Finish with Ult range.',
        const HeroStats(
            damage: 9.5,
            durability: 3.5,
            crowdControl: 2,
            mobility: 7,
            difficulty: 5.5),
        52,
        c: ['chou', 'saber', 'ling', 'fanny', 'lancelot'],
        s: ['balmond', 'layla', 'estes', 'nana']),

    // 21. Hayabusa
    _h(
        'hayabusa',
        21,
        'Hayabusa',
        HeroRole.assassin,
        [HeroLane.jungle],
        'Burst/Chase',
        'Shadow-based ninja assassin.',
        'Use shadows to poke. Ultimate executes lone targets.',
        const HeroStats(
            damage: 9.5,
            durability: 3,
            crowdControl: 3,
            mobility: 10,
            difficulty: 8.5),
        52,
        c: ['saber', 'eudora', 'khufra', 'franco', 'chou', 'nana'],
        s: ['layla', 'miya', 'lesley', 'hanabi', 'gord']),

    // 22. Atlas
    _h(
        'atlas',
        22,
        'Atlas',
        HeroRole.tank,
        [HeroLane.roam],
        'Initiator/Control',
        'High-impact teamfight initiator.',
        'Eject and Flicker for massive group stuns.',
        const HeroStats(
            damage: 4,
            durability: 9.5,
            crowdControl: 10,
            mobility: 6,
            difficulty: 6),
        53,
        c: ['diggie', 'valir', 'nana', 'akai', 'chou'],
        s: ['odette', 'pharsa', 'estes', 'layla', 'miya']),

    // 23. Guinevere
    _h(
        'guinevere',
        23,
        'Guinevere',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.jungle],
        'Burst/Magic',
        'Magic fighter with heavy crowd control.',
        'Jump in for knock-up, then follow with Ultimate.',
        const HeroStats(
            damage: 8.5,
            durability: 7,
            crowdControl: 9,
            mobility: 7.5,
            difficulty: 6.5),
        51,
        c: ['helcurt', 'chou', 'franco', 'khufra', 'ruby'],
        s: ['layla', 'miya', 'lesley', 'estes', 'nana']),

    // 24. Lesley
    _h(
        'lesley',
        24,
        'Lesley',
        HeroRole.marksman,
        [HeroLane.gold],
        'Burst/Poke',
        'Late-game sniper with true damage.',
        'Stay invisible. Use passive for massive single hits.',
        const HeroStats(
            damage: 10,
            durability: 2,
            crowdControl: 3,
            mobility: 6,
            difficulty: 3.5),
        50,
        c: ['saber', 'lancelot', 'ling', 'fanny', 'hayabusa', 'gusion'],
        s: ['balmond', 'tigreal', 'hylos', 'valir']),

    // 25. Helcurt
    _h(
        'helcurt',
        25,
        'Helcurt',
        HeroRole.assassin,
        [HeroLane.jungle],
        'Silence/Burst',
        'Disruptor who silences enemies.',
        'Use Ultimate to blind enemies. Teleport and burst.',
        const HeroStats(
            damage: 9.5,
            durability: 4,
            crowdControl: 8,
            mobility: 9,
            difficulty: 7.5),
        53,
        c: ['eudora', 'aurora', 'nana', 'khufra', 'akai'],
        s: ['fanny', 'ling', 'gusion', 'selena', 'eudora', 'odette']),

    // 26. Pharsa
    _h(
        'pharsa',
        26,
        'Pharsa',
        HeroRole.mage,
        [HeroLane.mid],
        'Burst/Poke',
        'Long-range air support mage.',
        'Position Ultimate carefully. Use bird form to escape.',
        const HeroStats(
            damage: 10,
            durability: 2,
            crowdControl: 7,
            mobility: 8,
            difficulty: 6),
        51,
        c: ['chou', 'helcurt', 'saber', 'ling', 'lancelot', 'fanny'],
        s: ['estes', 'tigreal', 'layla', 'miya', 'nana']),

    // 27. Badang
    _h(
        'badang',
        27,
        'Badang',
        HeroRole.fighter,
        [HeroLane.exp],
        'Burst/Control',
        'Wall-punching crowd controller.',
        'Trap enemies with walls. Ultimate for multi-stun.',
        const HeroStats(
            damage: 8,
            durability: 7.5,
            crowdControl: 9.5,
            mobility: 6.5,
            difficulty: 5),
        50,
        c: ['terizla', 'valir', 'khufra', 'lunox', 'karrie'],
        s: ['layla', 'miya', 'hanabi', 'gord', 'odette']),

    // 28. Lolita
    _h(
        'lolita',
        28,
        'Lolita',
        HeroRole.support,
        [HeroLane.roam],
        'Guard/Control',
        'The ultimate projectile blocker.',
        'Use shield to block bullets. Charge Ultimate in bush.',
        const HeroStats(
            damage: 3,
            durability: 9,
            crowdControl: 9.5,
            mobility: 6,
            difficulty: 5.5),
        54,
        c: ['lunox', 'valir', 'akai', 'chou', 'diggie'],
        s: ['chang\'e', 'lesley', 'layla', 'miya', 'cyclops', 'eudora']),

    // 29. Wanwan
    _h(
        'wanwan',
        29,
        'Wanwan',
        HeroRole.marksman,
        [HeroLane.gold],
        'Burst/Chase',
        'Agile marksman who hops between hits.',
        'Hit all weaknesses to unlock your Ultimate.',
        const HeroStats(
            damage: 9,
            durability: 3,
            crowdControl: 5,
            mobility: 10,
            difficulty: 9),
        52,
        c: ['khufra', 'phoveus', 'minsitthar', 'franco', 'kaja', 'saber'],
        s: ['tigreal', 'balmond', 'estes', 'hylos', 'franco']),

    // 30. Akai
    _h(
        'akai',
        30,
        'Akai',
        HeroRole.tank,
        [HeroLane.roam, HeroLane.jungle],
        'Control/Initiator',
        'The spinning panda disruptor.',
        'Pin enemies to walls with Heavy Spin.',
        const HeroStats(
            damage: 4.5,
            durability: 9,
            crowdControl: 10,
            mobility: 7,
            difficulty: 6.5),
        51,
        c: ['valir', 'diggie', 'nana', 'karrie', 'lunox'],
        s: ['fanny', 'ling', 'lancelot', 'gusion', 'chou']),
    // 31. Cecilion
    _h(
        'cecilion',
        31,
        'Cecilion',
        HeroRole.mage,
        [HeroLane.mid],
        'Burst/Poke',
        'Late-game magic powerhouse with infinite mana scaling.',
        'Maintain distance. Spam Skill 1 to collect stacks for massive late-game damage.',
        const HeroStats(
            damage: 10,
            durability: 3,
            crowdControl: 5,
            mobility: 4,
            difficulty: 4.5),
        52,
        c: ['helcurt', 'natalia', 'saber', 'ling', 'lancelot', 'gusion'],
        s: ['estes', 'tigreal', 'hylos', 'layla', 'miya']),

    // 32. Carmilla
    _h(
        'carmilla',
        32,
        'Carmilla',
        HeroRole.support,
        [HeroLane.roam],
        'Control/Guard',
        'Support that links enemies to share damage and CC.',
        'Use Ultimate to link as many enemies as possible before your team uses burst skills.',
        const HeroStats(
            damage: 5,
            durability: 8,
            crowdControl: 9,
            mobility: 7,
            difficulty: 5),
        51,
        c: ['valir', 'karrie', 'lunox', 'baxia', 'akai'],
        s: ['estes', 'angela', 'tigreal', 'balmond']),

    // 33. Khaleed
    _h(
        'khaleed',
        33,
        'Khaleed',
        HeroRole.fighter,
        [HeroLane.exp],
        'Burst/Regen',
        'Early-game lane bully with high sustain.',
        'Use Skill 1 to poke and clear waves. Use Skill 2 in bushes to bait enemy skills.',
        const HeroStats(
            damage: 8.5,
            durability: 8.5,
            crowdControl: 6,
            mobility: 8,
            difficulty: 4),
        50,
        c: ['franco', 'chou', 'nana', 'jawhead', 'khufra'],
        s: ['layla', 'miya', 'hanabi', 'gord', 'sun']),

    // 34. Brody
    _h(
        'brody',
        34,
        'Brody',
        HeroRole.marksman,
        [HeroLane.gold],
        'Burst/Chase',
        'Physical burst marksman with high mobility while attacking.',
        'Stack marks on enemies before using your Ultimate for a guaranteed execution.',
        const HeroStats(
            damage: 10,
            durability: 4,
            crowdControl: 5,
            mobility: 7.5,
            difficulty: 6),
        53,
        c: ['saber', 'hayabusa', 'ling', 'lancelot', 'eudora', 'natalia'],
        s: ['layla', 'miya', 'lesley', 'hanabi', 'karrie']),

    // 35. Benedetta
    _h(
        'benedetta',
        35,
        'Benedetta',
        HeroRole.assassin,
        [HeroLane.exp, HeroLane.jungle],
        'Chase/Burst',
        'High mobility assassin who relies on charged dashes.',
        'Master your passive dash. Use Skill 2 to block and counter enemy crowd control.',
        const HeroStats(
            damage: 9,
            durability: 5,
            crowdControl: 6,
            mobility: 10,
            difficulty: 9),
        52,
        c: ['khufra', 'minsitthar', 'phoveus', 'franco', 'kaja', 'nana'],
        s: ['layla', 'miya', 'eudora', 'pharsa', 'estes']),

    // 36. Paquito
    _h(
        'paquito',
        36,
        'Paquito',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.jungle],
        'Burst/Chase',
        'Combo-based fighter with high burst and low cooldowns.',
        'Always maintain 2 stacks before entering a fight to trigger your enhanced skills.',
        const HeroStats(
            damage: 9.5,
            durability: 7,
            crowdControl: 7,
            mobility: 9,
            difficulty: 8),
        54,
        c: ['esmeralda', 'alice', 'barats', 'khufra', 'nana'],
        s: ['layla', 'miya', 'lesley', 'hanabi', 'gusion']),

    // 37. Beatrix
    _h(
        'beatrix',
        37,
        'Beatrix',
        HeroRole.marksman,
        [HeroLane.gold],
        'Burst/Range',
        'Versatile marksman with 4 different weapon modes.',
        'Switch weapons based on the situation: Sniper for poke, Shotgun for close range.',
        const HeroStats(
            damage: 10,
            durability: 3,
            crowdControl: 2,
            mobility: 7,
            difficulty: 8.5),
        51,
        c: ['saber', 'hayabusa', 'ling', 'lancelot', 'natalia', 'gusion'],
        s: ['tigreal', 'balmond', 'estes', 'miya', 'layla']),

    // 38. Yve
    _h(
        'yve',
        38,
        'Yve',
        HeroRole.mage,
        [HeroLane.mid],
        'Burst/Poke',
        'Manipulation mage with a massive chessboard Ultimate.',
        'Place your Ultimate in a safe spot. Tap and slide to slow and damage enemies.',
        const HeroStats(
            damage: 9,
            durability: 3,
            crowdControl: 9,
            mobility: 5,
            difficulty: 7),
        50,
        c: ['kaja', 'franco', 'saber', 'ling', 'lancelot', 'fanny', 'chou'],
        s: ['estes', 'tigreal', 'layla', 'miya', 'gord']),

    // 39. Gloo
    _h(
        'gloo',
        39,
        'Gloo',
        HeroRole.tank,
        [HeroLane.roam, HeroLane.exp],
        'Control/Sustain',
        'Disruptive tank that attaches to enemies.',
        'Stack passives on enemies. Use Ultimate to attach to the enemy core and drag them out.',
        const HeroStats(
            damage: 5,
            durability: 9,
            crowdControl: 9,
            mobility: 7,
            difficulty: 6),
        52,
        c: ['faramis', 'vexana', 'valir', 'karrie', 'lunox'],
        s: ['layla', 'miya', 'lesley', 'hanabi', 'estes']),

    // 40. Edith
    _h(
        'edith',
        40,
        'Edith',
        HeroRole.tank,
        [HeroLane.roam, HeroLane.exp],
        'Control/Burst',
        'Hybrid tank/marksman who converts defense to magic damage.',
        'Absorb damage in tank form to gain Wrath, then use Ultimate to burst enemies down.',
        const HeroStats(
            damage: 8.5,
            durability: 9.5,
            crowdControl: 8,
            mobility: 6,
            difficulty: 6.5),
        53,
        c: ['karrie', 'lunox', 'valir', 'baxia', 'akai'],
        s: ['layla', 'miya', 'fanny', 'ling', 'lancelot']),

    // 41. Aamon
    _h(
        'aamon',
        41,
        'Aamon',
        HeroRole.assassin,
        [HeroLane.jungle],
        'Burst/Magic',
        'Cunning assassin who uses camouflage to strike.',
        'Use skills to trigger camouflage. Accumulate shards for a massive Ultimate execute.',
        const HeroStats(
            damage: 10,
            durability: 3.5,
            crowdControl: 3,
            mobility: 8.5,
            difficulty: 7),
        53,
        c: ['eudora', 'saber', 'khufra', 'franco', 'chou'],
        s: ['layla', 'miya', 'lesley', 'hanabi', 'gord']),

    // 42. Valentina
    _h(
        'valentina',
        42,
        'Valentina',
        HeroRole.mage,
        [HeroLane.mid, HeroLane.roam],
        'Copy/Burst',
        'Mage who steals enemy ultimates to use against them.',
        'S1 and S2 combo for fear CC. Save Ultimate to steal high-impact enemy teamfight skills.',
        const HeroStats(
            damage: 9,
            durability: 5,
            crowdControl: 8,
            mobility: 7.5,
            difficulty: 8.5),
        54,
        c: ['helcurt', 'hayabusa', 'ling', 'chou', 'nana'],
        s: ['estes', 'tigreal', 'atlas', 'odette', 'pharsa']),

    // 43. Yin
    _h(
        'yin',
        43,
        'Yin',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.jungle],
        'Burst/Control',
        'Duel master who traps enemies in his own dimension.',
        'Kidnap the enemy marksman or mage into your domain to secure a kill.',
        const HeroStats(
            damage: 9,
            durability: 6.5,
            crowdControl: 8,
            mobility: 8,
            difficulty: 6),
        51,
        c: ['khufra', 'valir', 'akai', 'edith', 'nana'],
        s: ['layla', 'miya', 'hanabi', 'lesley', 'estes']),

    // 44. Melissa
    _h(
        'melissa',
        44,
        'Melissa',
        HeroRole.marksman,
        [HeroLane.gold],
        'Reap/Damage',
        'Anti-assassin marksman with a protective barrier.',
        'Use Skill 2 to poke. Activate Ultimate to stay safe from melee attackers.',
        const HeroStats(
            damage: 9.5,
            durability: 3,
            crowdControl: 6,
            mobility: 7.5,
            difficulty: 7),
        53,
        c: ['franco', 'saber', 'eudora', 'lesley', 'kadita'],
        s: ['alucard', 'chou', 'balmond', 'tigreal', 'akai']),

    // 45. Xavier
    _h(
        'xavier',
        45,
        'Xavier',
        HeroRole.mage,
        [HeroLane.mid],
        'Damage/Guard',
        'Long-range artillery mage with high CC potential.',
        'Spam S1 and S2 for stuns. Use Ult for global snipes on low-HP enemies.',
        const HeroStats(
            damage: 10,
            durability: 2.5,
            crowdControl: 9,
            mobility: 4,
            difficulty: 6.5),
        52,
        c: ['fanny', 'ling', 'helcurt', 'natalia', 'gusion'],
        s: ['estes', 'tigreal', 'hylos', 'layla', 'miya']),

    // 46. Julian
    _h(
        'julian',
        46,
        'Julian',
        HeroRole.fighter,
        [HeroLane.jungle, HeroLane.exp, HeroLane.mid],
        'Chase/Magic Burst',
        'Versatile hero with multiple enhanced skill paths.',
        'No Ultimate; your third skill is always enhanced. Choose the combo your team needs.',
        const HeroStats(
            damage: 9.5,
            durability: 6,
            crowdControl: 8.5,
            mobility: 7,
            difficulty: 8),
        54,
        c: ['chou', 'franco', 'kaja', 'valir', 'khufra'],
        s: ['layla', 'lesley', 'miya', 'eudora', 'estes']),

    // 47. Fredrinn
    _h(
        'fredrinn',
        47,
        'Fredrinn',
        HeroRole.tank,
        [HeroLane.jungle, HeroLane.exp],
        'Damage/Regen',
        'Durable tank who converts damage taken into powerful attacks.',
        'Taunt enemies and absorb damage. Use Ultimate for a massive area execution.',
        const HeroStats(
            damage: 7,
            durability: 10,
            crowdControl: 9,
            mobility: 5,
            difficulty: 6),
        55,
        c: ['karrie', 'lunox', 'valir', 'baxia', 'dyrroth'],
        s: ['fanny', 'ling', 'lancelot', 'gusion', 'hayabusa']),

    // 48. Joy
    _h(
        'joy',
        48,
        'Joy',
        HeroRole.assassin,
        [HeroLane.jungle, HeroLane.exp],
        'Chase/Damage',
        'Rhythmic assassin with incredible dash sustain.',
        'Dash on the beat to gain shields and unlock the power of your Ultimate.',
        const HeroStats(
            damage: 9,
            durability: 5.5,
            crowdControl: 4,
            mobility: 10,
            difficulty: 9.5),
        53,
        c: ['kaja', 'franco', 'minsitthar', 'phoveus', 'khufra'],
        s: ['layla', 'miya', 'hanabi', 'estes', 'pharsa']),

    // 49. Arlott
    _h(
        'arlott',
        49,
        'Arlott',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.roam],
        'Burst/Control',
        'High-speed dasher who capitalizes on enemy displacement.',
        'Wait for marks to appear, then chain Skill 2 dashes for infinite mobility.',
        const HeroStats(
            damage: 8.5,
            durability: 7,
            crowdControl: 9.5,
            mobility: 9,
            difficulty: 8),
        52,
        c: ['khufra', 'phoveus', 'minsitthar', 'nana', 'akai'],
        s: ['layla', 'miya', 'lesley', 'eudora', 'estes']),

    // 50. Novaria
    _h(
        'novaria',
        50,
        'Novaria',
        HeroRole.mage,
        [HeroLane.mid],
        'Burst/Poke',
        'Sniper mage who provides vision and long-range damage.',
        'Use Ultimate to mark enemy hitboxes. Snipe from afar with Skill 2.',
        const HeroStats(
            damage: 9.5,
            durability: 3,
            crowdControl: 5,
            mobility: 8.5,
            difficulty: 7.5),
        51,
        c: ['ling', 'fanny', 'helcurt', 'saber', 'lancelot'],
        s: ['estes', 'tigreal', 'layla', 'miya', 'nana']),

    // 51. Ixia
    _h(
        'ixia',
        51,
        'Ixia',
        HeroRole.marksman,
        [HeroLane.gold],
        'Reap/Damage',
        'High-ground marksman with a massive fan-shaped Ultimate.',
        'Position yourself safely before using Ultimate to dominate teamfights.',
        const HeroStats(
            damage: 10,
            durability: 3,
            crowdControl: 5.5,
            mobility: 4.5,
            difficulty: 6),
        51,
        c: ['saber', 'ling', 'fanny', 'eudora', 'chou', 'gusion'],
        s: ['tigreal', 'estes', 'balmond', 'miya', 'layla']),

    // 52. Nolan
    _h(
        'nolan',
        52,
        'Nolan',
        HeroRole.assassin,
        [HeroLane.jungle],
        'Chase/Burst',
        'Rift-cutting assassin with ultra-fast skill rotations.',
        'Create rift intersections for explosions. Use Ult to cleanse CC and escape.',
        const HeroStats(
            damage: 10,
            durability: 4,
            crowdControl: 3,
            mobility: 10,
            difficulty: 8.5),
        54,
        c: ['khufra', 'franco', 'kaja', 'saber', 'eudora'],
        s: ['layla', 'miya', 'lesley', 'hanabi', 'gord']),

    // 53. Cici
    _h(
        'cici',
        53,
        'Cici',
        HeroRole.fighter,
        [HeroLane.exp],
        'Damage/Regen',
        'Yo-yo wielding fighter who kites enemies with high speed.',
        'Maintain distance while Skill 1 is active to melt enemy HP while moving.',
        const HeroStats(
            damage: 8,
            durability: 8,
            crowdControl: 4,
            mobility: 9,
            difficulty: 5),
        52,
        c: ['saber', 'eudora', 'chou', 'franco', 'khufra'],
        s: ['balmond', 'tigreal', 'hylos', 'layla', 'miya']),

    // 54. Terizla
    _h(
        'terizla',
        54,
        'Terizla',
        HeroRole.fighter,
        [HeroLane.exp],
        'Burst/Control',
        'Slow but heavy hitter with extreme damage reduction.',
        'Use Ultimate to pull enemies together, then follow with heavy Skill 2 hits.',
        const HeroStats(
            damage: 9.5,
            durability: 9.5,
            crowdControl: 8,
            mobility: 3,
            difficulty: 4.5),
        53,
        c: ['valir', 'lunox', 'karrie', 'baxia', 'wanwan'],
        s: ['chou', 'badang', 'alucard', 'paquito', 'yin']),

    // 55. Esmeralda
    _h(
        'esmeralda',
        55,
        'Esmeralda',
        HeroRole.mage,
        [HeroLane.exp, HeroLane.mid],
        'Regen/Mixed Damage',
        'Shield-absorbing battle mage who thrives in prolonged fights.',
        'Spam Skill 1 and 2 to constantly steal enemy shields and boost speed.',
        const HeroStats(
            damage: 7.5,
            durability: 9,
            crowdControl: 4,
            mobility: 8,
            difficulty: 6.5),
        52,
        c: ['baxia', 'karrie', 'dyrroth', 'lunox', 'franco'],
        s: ['pharsa', 'odette', 'estes', 'angela', 'lolita']),

    // 56. Martis
    _h(
        'martis',
        56,
        'Martis',
        HeroRole.fighter,
        [HeroLane.jungle, HeroLane.exp],
        'Burst/Control',
        'Unstoppable fighter with CC immunity during Skill 2.',
        'Use Skill 2 to block CC. Use Ultimate to execute and reset CD for a savage.',
        const HeroStats(
            damage: 9,
            durability: 7.5,
            crowdControl: 8,
            mobility: 7,
            difficulty: 5.5),
        54,
        c: ['franco', 'kaja', 'khufra', 'valir', 'baxia'],
        s: ['nana', 'layla', 'miya', 'estes', 'rafaela']),

    // 57. Lapu-Lapu
    _h(
        'lapulapu',
        57,
        'Lapu-Lapu',
        HeroRole.fighter,
        [HeroLane.exp],
        'Burst/Guard',
        'Heavy fighter with massive damage reduction in Twin Blade form.',
        'Engage with Ultimate to gain defense and massive AOE burst damage.',
        const HeroStats(
            damage: 8.5,
            durability: 9,
            crowdControl: 7,
            mobility: 7.5,
            difficulty: 6),
        52,
        c: ['esmeralda', 'karrie', 'valir', 'baxia', 'wanwan'],
        s: ['pharsa', 'layla', 'miya', 'lesley', 'hanabi']),

    // 58. Thamuz
    _h(
        'thamuz',
        58,
        'Thamuz',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.jungle],
        'Regen/True Damage',
        'Early-game lane bully with insane health regeneration.',
        'Spam scythes to slow enemies. Activate Ult for massive sustain in teamfights.',
        const HeroStats(
            damage: 8,
            durability: 9.5,
            crowdControl: 3,
            mobility: 6,
            difficulty: 4.5),
        51,
        c: ['baxia', 'valir', 'karrie', 'lunox', 'dyrroth'],
        s: ['balmond', 'sun', 'alucard', 'zilong', 'layla']),

    // 59. Lunox
    _h(
        'lunox',
        59,
        'Lunox',
        HeroRole.mage,
        [HeroLane.mid, HeroLane.gold],
        'Burst/Poke',
        'Versatile mage who toggles between healing and heavy magic penetration.',
        'Use Brilliant version to escape or stay safe. Use Darkening to burst tanks.',
        const HeroStats(
            damage: 10,
            durability: 5,
            crowdControl: 4,
            mobility: 7,
            difficulty: 8.5),
        53,
        c: ['saber', 'ling', 'lancelot', 'helcurt', 'natalia'],
        s: ['hylos', 'tigreal', 'balmond', 'terizla', 'fredrinn']),

    // 60. Claude
    _h(
        'claude',
        60,
        'Claude',
        HeroRole.marksman,
        [HeroLane.gold, HeroLane.jungle],
        'Burst/Chase',
        'High mobility marksman who excels at diving teamfights.',
        'Keep stacks full with S1. Use S2 to dive with Ultimate and blink back safely.',
        const HeroStats(
            damage: 9,
            durability: 4,
            crowdControl: 2,
            mobility: 10,
            difficulty: 8),
        52,
        c: ['saber', 'masha', 'franco', 'kaja', 'khufra', 'eudora'],
        s: ['tigreal', 'estes', 'pharsa', 'layla', 'miya']),

    // 61. Yu Zhong
    _h(
        'yuzhong',
        61,
        'Yu Zhong',
        HeroRole.fighter,
        [HeroLane.exp],
        'Regen/Burst',
        'Black Dragon who dominates lane with life drain.',
        'Apply Sha Residue to 5 stacks to heal. Use Dragon form to dive the backline.',
        const HeroStats(
            damage: 8.5,
            durability: 9,
            crowdControl: 7.5,
            mobility: 7,
            difficulty: 7),
        53,
        c: ['baxia', 'karrie', 'lunox', 'dyrroth', 'valir'],
        s: ['terizla', 'lapulapu', 'balmond', 'layla', 'miya']),

    // 62. Phoveus
    _h(
        'phoveus',
        62,
        'Phoveus',
        HeroRole.fighter,
        [HeroLane.exp],
        'Chase/Control',
        'The ultimate counter to high-mobility dash heroes.',
        'Wait for enemies to dash, then spam your Ultimate to teleport and smash them.',
        const HeroStats(
            damage: 8,
            durability: 8.5,
            crowdControl: 7,
            mobility: 8,
            difficulty: 6),
        52,
        c: ['franco', 'kaja', 'esmeralda', 'lunox', 'karrie'],
        s: ['wanwan', 'benedetta', 'lancelot', 'fanny', 'joy', 'arlott']),

    // 63. Baxia
    _h(
        'baxia',
        63,
        'Baxia',
        HeroRole.tank,
        [HeroLane.roam, HeroLane.jungle],
        'Guard/Initiator',
        'The living anti-heal machine with high mobility.',
        'Roll into enemies to initiate. Spam Skill 2 on high-regen targets to reduce their healing.',
        const HeroStats(
            damage: 5,
            durability: 9.5,
            crowdControl: 6,
            mobility: 9,
            difficulty: 4.5),
        54,
        c: ['karrie', 'lunox', 'valir', 'x.borg', 'dyrroth'],
        s: ['estes', 'esmeralda', 'alucard', 'thamuz', 'yuzhong', 'uranus']),

    // 64. Minsitthar
    _h(
        'minsitthar',
        64,
        'Minsitthar',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.roam],
        'Control/Guard',
        'King of the battlefield who forbids enemy dashing.',
        'Hook enemies into your Ultimate. Enemies inside cannot use any blink or dash skills.',
        const HeroStats(
            damage: 7,
            durability: 8.5,
            crowdControl: 10,
            mobility: 4.5,
            difficulty: 6.5),
        53,
        c: ['helcurt', 'nana', 'diggie', 'valir', 'kadita'],
        s: ['fanny', 'ling', 'lancelot', 'gusion', 'wanwan', 'joy']),

    // 65. Kadita
    _h(
        'kadita',
        65,
        'Kadita',
        HeroRole.mage,
        [HeroLane.mid, HeroLane.roam],
        'Burst/Chase',
        'Ocean goddess with high-burst magic and invincibility frames.',
        'Use S1 to dive, S2 for knock-up, and Ult for massive AOE burst. Use S1 to escape CC.',
        const HeroStats(
            damage: 10,
            durability: 4.5,
            crowdControl: 7.5,
            mobility: 8.5,
            difficulty: 7.5),
        54,
        c: ['kaja', 'franco', 'saber', 'helcurt', 'nana'],
        s: ['layla', 'miya', 'lesley', 'hanabi', 'pharsa', 'ixia']),

    // 66. Harith
    _h(
        'harith',
        66,
        'Harith',
        HeroRole.mage,
        [HeroLane.gold, HeroLane.mid],
        'Burst/Chase',
        'Hyper-active mage who excels in continuous dashing and shielding.',
        'Stay inside your Ultimate field to spam Skill 2 dashes and Skill 1 bursts.',
        const HeroStats(
            damage: 9,
            durability: 6.5,
            crowdControl: 4.5,
            mobility: 10,
            difficulty: 8.5),
        52,
        c: ['phoveus', 'minsitthar', 'khufra', 'saber', 'eudora'],
        s: ['balmond', 'hylos', 'tigreal', 'alucard', 'dyrroth']),

    // 67. Moskov
    _h(
        'moskov',
        67,
        'Moskov',
        HeroRole.marksman,
        [HeroLane.gold],
        'Burst/Chase',
        'High attack-speed marksman who pins enemies to walls.',
        'Position yourself to pin enemies against walls for a long stun. Use passive to clear waves fast.',
        const HeroStats(
            damage: 10,
            durability: 3,
            crowdControl: 6,
            mobility: 9.5,
            difficulty: 8),
        51,
        c: ['saber', 'eudora', 'lesley', 'hayabusa', 'ling', 'fanny'],
        s: ['tigreal', 'estes', 'balmond', 'layla', 'miya', 'hanabi']),

    // 68. Hanabi
    _h(
        'hanabi',
        68,
        'Hanabi',
        HeroRole.marksman,
        [HeroLane.gold],
        'Reap/Damage',
        'Crowd-control immune marksman with bouncing blades.',
        'Keep your shield active to remain immune to CC. Use Ultimate to link and root multiple enemies.',
        const HeroStats(
            damage: 8.5,
            durability: 5,
            crowdControl: 8,
            mobility: 3,
            difficulty: 3),
        50,
        c: ['fanny', 'ling', 'lancelot', 'gusion', 'saber', 'hayabusa'],
        s: ['tigreal', 'atlas', 'estes', 'nana', 'minotaur']),

    // 69. Zhask
    _h(
        'zhask',
        69,
        'Zhask',
        HeroRole.mage,
        [HeroLane.mid],
        'Burst/Poke',
        'Summoner from the swarm who fights through a giant turret.',
        'Summon Nightmaric Spawn. Use Ultimate to fuse with it for massive damage and defense.',
        const HeroStats(
            damage: 10,
            durability: 6,
            crowdControl: 7.5,
            mobility: 4,
            difficulty: 6),
        52,
        c: ['helcurt', 'natalia', 'ling', 'fanny', 'lancelot', 'hanzo'],
        s: ['layla', 'miya', 'estes', 'tigreal', 'balmond']),

    // 70. Argus
    _h(
        'argus',
        70,
        'Argus',
        HeroRole.fighter,
        [HeroLane.exp],
        'Burst/Regen',
        'Fallen angel who cannot be killed during his Ultimate.',
        'Activate Ultimate when low on HP. You are invincible and heal from the damage you deal.',
        const HeroStats(
            damage: 9.5,
            durability: 10, // During Ult
            crowdControl: 4,
            mobility: 7,
            difficulty: 5),
        49,
        c: ['valir', 'akai', 'nana', 'diggie', 'chou', 'jawhead'],
        s: ['layla', 'miya', 'hanabi', 'sun', 'gord', 'zilong']),

    // 71. Sun
    _h(
        'sun',
        71,
        'Sun',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.jungle],
        'Push/Damage',
        'Monkey King who creates clones to overwhelm enemies and turrets.',
        'Use clones to confuse enemies and tank turret shots. Focus on split-pushing.',
        const HeroStats(
            damage: 8.5,
            durability: 7,
            crowdControl: 3,
            mobility: 7,
            difficulty: 4.5),
        49,
        c: ['terizla', 'ruby', 'balmond', 'alucard', 'pharsa'],
        s: ['layla', 'miya', 'lesley', 'hanabi', 'gord']),

    // 72. Bruno
    _h(
        'bruno',
        72,
        'Bruno',
        HeroRole.marksman,
        [HeroLane.gold],
        'Burst/Damage',
        'Football-themed marksman with high critical damage.',
        'Keep your Powerball active by catching it. Use Ultimate to bounce between grouped enemies.',
        const HeroStats(
            damage: 10,
            durability: 3,
            crowdControl: 5,
            mobility: 7,
            difficulty: 5),
        52,
        c: ['saber', 'eudora', 'hayabusa', 'ling', 'fanny', 'lancelot'],
        s: ['tigreal', 'balmond', 'hylos', 'layla', 'miya']),

    // 73. Johnson
    _h(
        'johnson',
        73,
        'Johnson',
        HeroRole.tank,
        [HeroLane.roam],
        'Initiator/Support',
        'Transforming car that provides global map pressure.',
        'Carry a high-damage teammate (like Odette) and crash into enemy carries.',
        const HeroStats(
            damage: 6,
            durability: 9.5,
            crowdControl: 9,
            mobility: 9,
            difficulty: 6.5),
        51,
        c: ['diggie', 'valir', 'akai', 'nana', 'karrie', 'lunox'],
        s: ['layla', 'miya', 'hanabi', 'lesley', 'estes']),

    // 74. Gord
    _h(
        'gord',
        74,
        'Gord',
        HeroRole.mage,
        [HeroLane.mid],
        'Poke/Burst',
        'Pure magic laser specialist with high area damage.',
        'Stun with Skill 1, then follow with Skill 2 and Ultimate to melt enemies from afar.',
        const HeroStats(
            damage: 10,
            durability: 2,
            crowdControl: 7,
            mobility: 3,
            difficulty: 5),
        50,
        c: ['fanny', 'ling', 'lancelot', 'hayabusa', 'saber', 'helcurt'],
        s: ['tigreal', 'hylos', 'balmond', 'estes', 'layla']),

    // 75. Lylia
    _h(
        'lylia',
        75,
        'Lylia',
        HeroRole.mage,
        [HeroLane.mid],
        'Burst/Poke',
        'Time-manipulating mage with extreme explosive potential.',
        'Spam Shadow Energy on Gloom. Use Ultimate to regain health and mana while resetting position.',
        const HeroStats(
            damage: 9,
            durability: 6,
            crowdControl: 7,
            mobility: 8.5,
            difficulty: 7.5),
        53,
        c: ['chou', 'saber', 'franco', 'kaja', 'helcurt'],
        s: ['tigreal', 'hylos', 'balmond', 'estes', 'layla', 'miya']),

    // 76. Alpha
    _h(
        'alpha',
        76,
        'Alpha',
        HeroRole.fighter,
        [HeroLane.jungle, HeroLane.exp],
        'Charge/Damage',
        'True damage specialist supported by his drone, Beta.',
        'Spam skills to trigger Beta\'s true damage. Use Ultimate to initiate or lock down targets.',
        const HeroStats(
            damage: 8.5,
            durability: 8,
            crowdControl: 7.5,
            mobility: 6.5,
            difficulty: 4),
        54,
        c: ['baxia', 'valir', 'karrie', 'lunox', 'esmeralda'],
        s: ['sun', 'balmond', 'layla', 'miya', 'hanabi', 'estes']),

    // 77. Barats
    _h(
        'barats',
        77,
        'Barats',
        HeroRole.tank,
        [HeroLane.jungle, HeroLane.exp],
        'Damage/Control',
        'Dino-rider who grows larger and tankier as he stacks.',
        'Keep your Big Guy stacks full by hitting enemies. Use Ult to suppress and swallow high-value targets.',
        const HeroStats(
            damage: 7.5,
            durability: 9.5,
            crowdControl: 9,
            mobility: 5,
            difficulty: 6),
        55,
        c: ['karrie', 'lunox', 'valir', 'baxia', 'dyrroth'],
        s: ['fanny', 'ling', 'lancelot', 'gusion', 'chou']),

    // 78. Angela
    _h(
        'angela',
        78,
        'Angela',
        HeroRole.support,
        [HeroLane.roam],
        'Support/Guard',
        'Puppeteer who possesses allies to provide shields and heals.',
        'Possess your jungler or carry during dives to provide shields and slow down enemies.',
        const HeroStats(
            damage: 5,
            durability: 4,
            crowdControl: 7,
            mobility: 8,
            difficulty: 4.5),
        54,
        c: ['natalia', 'helcurt', 'saber', 'ling', 'fanny'],
        s: ['estes', 'rafaela', 'nana', 'layla', 'miya']),

    // 79. Diggie
    _h(
        'diggie',
        79,
        'Diggie',
        HeroRole.support,
        [HeroLane.roam],
        'Guard/Control',
        'The master of time and the ultimate counter to CC.',
        'Save your Ultimate to cleanse entire enemy team-wide crowd control effects.',
        const HeroStats(
            damage: 6,
            durability: 5,
            crowdControl: 9,
            mobility: 6,
            difficulty: 5.5),
        55,
        c: ['eudora', 'saber', 'helcurt', 'natalia', 'karina'],
        s: ['tigreal', 'atlas', 'johnson', 'khufra', 'minotaur', 'guinevere']),

    // 80. Kaja
    _h(
        'kaja',
        80,
        'Kaja',
        HeroRole.support,
        [HeroLane.roam, HeroLane.exp],
        'Control/Charge',
        'Bird warrior with an inescapable suppressive hook.',
        'Flicker into the enemy backline and suppress the carry with your Divine Judgment.',
        const HeroStats(
            damage: 6.5,
            durability: 7.5,
            crowdControl: 10,
            mobility: 8,
            difficulty: 7),
        53,
        c: ['nana', 'diggie', 'valir', 'kadita', 'franco'],
        s: ['fanny', 'ling', 'lancelot', 'gusion', 'wanwan', 'joy', 'nolan']),

    // 81. Odette
    _h(
        'odette',
        81,
        'Odette',
        HeroRole.mage,
        [HeroLane.mid],
        'Burst/Poke',
        'Swan Princess with massive area-of-effect magic damage.',
        'Use Ultimate in the middle of teamfights. Best combined with Johnson or Tigreal.',
        const HeroStats(
            damage: 9,
            durability: 3,
            crowdControl: 8,
            mobility: 3,
            difficulty: 4),
        51,
        c: ['khufra', 'franco', 'saber', 'kaja', 'chou', 'jawhead'],
        s: ['tigreal', 'estes', 'balmond', 'layla', 'miya', 'johnson']),

    // 82. Kagura
    _h(
        'kagura',
        82,
        'Kagura',
        HeroRole.mage,
        [HeroLane.mid],
        'Burst/Reap',
        'Umbrella master with high burst and multiple escape tools.',
        'Master the umbrella toss-and-pull combo to burst enemies while staying safe.',
        const HeroStats(
            damage: 9,
            durability: 4,
            crowdControl: 8,
            mobility: 9,
            difficulty: 9),
        53,
        c: ['zilong', 'helcurt', 'saber', 'hayabusa', 'gusion'],
        s: ['eudora', 'nana', 'layla', 'miya', 'lesley', 'estes']),

    // 83. Zilong
    _h(
        'zilong',
        83,
        'Zilong',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.jungle],
        'Burst/Chase',
        'High-speed spearman specialized in pick-offs and pushing.',
        'Wait in bushes to ambush squishy targets. Use Ult to chase or escape quickly.',
        const HeroStats(
            damage: 9.5,
            durability: 5,
            crowdControl: 4,
            mobility: 9,
            difficulty: 3),
        49,
        c: ['khufra', 'minsitthar', 'tigreal', 'hylos', 'baxia', 'terizla'],
        s: ['layla', 'miya', 'hanabi', 'gord', 'estes', 'chang\'e']),

    // 84. X.Borg
    _h(
        'xborg',
        84,
        'X.Borg',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.jungle],
        'Regen/Burst',
        'Fire-wielding cyborg with true damage and shield mechanics.',
        'Keep your distance while spraying fire. Use Ult when enemy HP is low for a true damage explosion.',
        const HeroStats(
            damage: 8.5,
            durability: 8.5,
            crowdControl: 6,
            mobility: 7,
            difficulty: 5),
        54,
        c: ['lunox', 'karrie', 'baxia', 'dyrroth', 'valir'],
        s: ['tigreal', 'hylos', 'balmond', 'terizla', 'uranus', 'estes']),

    // 85. Natalia
    _h(
        'natalia',
        85,
        'Natalia',
        HeroRole.assassin,
        [HeroLane.roam, HeroLane.jungle],
        'Chase/Burst',
        'Invisible predator who silences and executes marksmen.',
        'Stay in bushes to enter stealth. Silence the mage or marksman before they can react.',
        const HeroStats(
            damage: 9.5,
            durability: 3,
            crowdControl: 7,
            mobility: 9,
            difficulty: 8),
        52,
        c: ['rafaela', 'aldous', 'nana', 'hylos', 'kaja', 'popol'],
        s: ['layla', 'miya', 'lesley', 'hanabi', 'pharsa', 'yve', 'cecilion']),

    // 86. Minotaur
    _h(
        'minotaur',
        86,
        'Minotaur',
        HeroRole.tank,
        [HeroLane.roam],
        'Control/Support',
        'Raging bull who provides massive heals and knock-ups.',
        'Heal allies to gain rage. Use Ultimate in the middle of the enemy team for a triple knock-up.',
        const HeroStats(
            damage: 4,
            durability: 9.5,
            crowdControl: 10,
            mobility: 5,
            difficulty: 5),
        55,
        c: ['diggie', 'valir', 'akai', 'lunox', 'karrie'],
        s: ['fanny', 'ling', 'lancelot', 'guinevere', 'chou', 'badang']),

    // 87. Karina
    _h(
        'karina',
        87,
        'Karina',
        HeroRole.assassin,
        [HeroLane.jungle],
        'Burst/Reap',
        'Magic assassin who resets cooldowns on every kill.',
        'Wait for enemies to be low on HP, then dive in to chain-kill with Ultimate resets.',
        const HeroStats(
            damage: 10,
            durability: 4,
            crowdControl: 2,
            mobility: 8.5,
            difficulty: 5),
        53,
        c: ['khufra', 'franco', 'eudora', 'saber', 'nana', 'ruby'],
        s: ['layla', 'miya', 'hanabi', 'lesley', 'bruno', 'ixia']),

    // 88. Hanzo
    _h(
        'hanzo',
        88,
        'Hanzo',
        HeroRole.assassin,
        [HeroLane.jungle],
        'Burst/Poke',
        'Shadow ninja who attacks from long range via his soul.',
        'Hide your real body in a safe bush. Use the demon soul to dive and steal buffs.',
        const HeroStats(
            damage: 9.5,
            durability: 2,
            crowdControl: 4,
            mobility: 8,
            difficulty: 7),
        50,
        c: ['natalia', 'helcurt', 'ling', 'fanny', 'lancelot', 'gusion'],
        s: ['layla', 'miya', 'hanabi', 'gord', 'estes', 'pharsa']),

    // 89. Saber
    _h(
        'saber',
        89,
        'Saber',
        HeroRole.assassin,
        [HeroLane.jungle, HeroLane.roam],
        'Burst/Control',
        'One-shot specialist who shuts down high-mobility carries.',
        'Lock onto the enemy core with your Ultimate. Perfect for stopping Fanny or Ling.',
        const HeroStats(
            damage: 10,
            durability: 3,
            crowdControl: 8,
            mobility: 7,
            difficulty: 4),
        54,
        c: ['khufra', 'franco', 'nana', 'antique_cuirass', 'winter_truncheon'],
        s: ['fanny', 'ling', 'gusion', 'lancelot', 'hayabusa', 'lesley']),

    // 90. Masha
    _h(
        'masha',
        90,
        'Masha',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.roam],
        'Push/Burst',
        'Three-health-bar warrior who melts tanks and turrets.',
        'Focus on objectives. Use your massive HP pool and attack speed to duel anyone.',
        const HeroStats(
            damage: 9,
            durability: 9.5,
            crowdControl: 4,
            mobility: 8,
            difficulty: 6),
        52,
        c: ['baxia', 'karrie', 'lunox', 'valir', 'estes'],
        s: ['hylos', 'tigreal', 'balmond', 'uranus', 'layla', 'miya']),

    // 91. Ruby
    _h(
        'ruby',
        91,
        'Ruby',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.roam],
        'Control/Regen',
        'Crowd control queen with massive lifesteal capabilities.',
        'Hook enemies back and use Skill 2 to cancel their dashes. Jump to reposition after every skill.',
        const HeroStats(
            damage: 7,
            durability: 8.5,
            crowdControl: 9.5,
            mobility: 7,
            difficulty: 5.5),
        53,
        c: ['phoveus', 'baxia', 'valir', 'minsitthar'],
        s: ['alucard', 'chou', 'lancelot', 'fanny', 'gusion']),

    // 92. Chang'e
    _h(
        'change',
        92,
        'Chang\'e',
        HeroRole.mage,
        [HeroLane.mid, HeroLane.gold],
        'Poke/Burst',
        'Long-range artillery mage who melts turrets and tanks.',
        'Keep your shield (S2) active at all times to increase damage. Use Ult to secure objectives or melt frontlines.',
        const HeroStats(
            damage: 10,
            durability: 3,
            crowdControl: 4,
            mobility: 8,
            difficulty: 4.5),
        51,
        c: ['lolita', 'saber', 'ling', 'fanny', 'hayabusa', 'khufra'],
        s: ['hylos', 'tigreal', 'estes', 'balmond', 'uranus']),

    // 93. Hylos
    _h(
        'hylos',
        93,
        'Hylos',
        HeroRole.tank,
        [HeroLane.roam, HeroLane.jungle],
        'Guard/Control',
        'The tank with the highest HP who burns enemies by standing near them.',
        'Activate S2 and walk into the enemy team. Use Ult to provide a speed path for your allies.',
        const HeroStats(
            damage: 5,
            durability: 10,
            crowdControl: 7,
            mobility: 6,
            difficulty: 2.5),
        54,
        c: ['karrie', 'lunox', 'valir', 'baxia', 'dyrroth'],
        s: ['fanny', 'lancelot', 'helcurt', 'natalia', 'gusion']),

    // 94. Uranus
    _h(
        'uranus',
        94,
        'Uranus',
        HeroRole.tank,
        [HeroLane.exp],
        'Regen/Damage',
        'Unstoppable regen tank who wins by outlasting everyone.',
        'Stack your passive by taking damage. Keep S1 stacks on enemies to maximize your damage and heal.',
        const HeroStats(
            damage: 6,
            durability: 10,
            crowdControl: 2,
            mobility: 7.5,
            difficulty: 4),
        52,
        c: ['baxia', 'karrie', 'dyrroth', 'lunox', 'franco', 'kaja'],
        s: ['pharsa', 'change', 'lesley', 'estes', 'angela']),

    // 95. Popol and Kupa
    _h(
        'popol',
        95,
        'Popol and Kupa',
        HeroRole.marksman,
        [HeroLane.gold, HeroLane.roam],
        'Push/Control',
        'Duo marksman who uses a wolf to tank and stun.',
        'Use Kupa to block projectiles and initiate stuns. Place traps in bushes for vision.',
        const HeroStats(
            damage: 9,
            durability: 5,
            crowdControl: 8.5,
            mobility: 6,
            difficulty: 7),
        53,
        c: ['natalia', 'saber', 'hayabusa', 'ling', 'lancelot'],
        s: ['natalia', 'miya', 'layla', 'lesley', 'hanabi']),

    // 96. Gatotkaca
    _h(
        'gatotkaca',
        96,
        'Gatotkaca',
        HeroRole.tank,
        [HeroLane.exp, HeroLane.roam],
        'Control/Burst',
        'Physical defense specialist who hits harder as he takes damage.',
        'Taunt physical attackers to trigger your passive. Use Ult to initiate from long distance.',
        const HeroStats(
            damage: 7.5,
            durability: 9.5,
            crowdControl: 9,
            mobility: 5,
            difficulty: 5),
        52,
        c: ['karrie', 'lunox', 'valir', 'baxia', 'dyrroth'],
        s: ['bruno', 'claude', 'sun', 'moskov', 'miya', 'alucard']),

    // 97. Aurora
    _h(
        'aurora',
        97,
        'Aurora',
        HeroRole.mage,
        [HeroLane.mid],
        'Control/Burst',
        'Ice queen who provides a second life and massive AOE freeze.',
        'Save your freeze for the enemy core. Your passive acts as a free Winter Truncheon.',
        const HeroStats(
            damage: 9.5,
            durability: 5.5,
            crowdControl: 10,
            mobility: 3,
            difficulty: 4),
        54,
        c: ['helcurt', 'saber', 'lancelot', 'ling', 'gusion'],
        s: ['fanny', 'ling', 'gusion', 'lancelot', 'joy', 'nolan']),

    // 98. Freya
    _h(
        'freya',
        98,
        'Freya',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.jungle],
        'Burst/Chase',
        'Valkyrie warrior with high attack speed and constant shielding.',
        'Spam Skill 2 to gain shields and reset your attack speed. Ultimate makes you massive and durable.',
        const HeroStats(
            damage: 9,
            durability: 8,
            crowdControl: 6,
            mobility: 7,
            difficulty: 6.5),
        52,
        c: ['khufra', 'franco', 'ruby', 'terizla', 'minsitthar'],
        s: ['sun', 'zilong', 'alucard', 'layla', 'miya']),

    // 99. Cyclops
    _h(
        'cyclops',
        99,
        'Cyclops',
        HeroRole.mage,
        [HeroLane.mid, HeroLane.jungle],
        'Poke/Chase',
        'Single-target lockdown mage with extremely low cooldowns.',
        'Use S2 for speed and damage. Ultimate is a guaranteed lock on high-mobility enemies.',
        const HeroStats(
            damage: 9,
            durability: 5,
            crowdControl: 7.5,
            mobility: 7.5,
            difficulty: 4),
        51,
        c: ['lolita', 'helcurt', 'saber', 'ling', 'lancelot'],
        s: ['fanny', 'ling', 'gusion', 'hayabusa', 'chou']),

    // 100. Aldous
    _h(
        'aldous',
        100,
        'Aldous',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.jungle],
        'Burst/Chase',
        'The late-game king who can one-shot almost any hero.',
        'Focus on stacking S1 on minions and creeps. Use Ult to reveal enemy positions and dive the carry.',
        const HeroStats(
            damage: 10,
            durability: 8,
            crowdControl: 6,
            mobility: 8,
            difficulty: 7),
        50,
        c: ['lunox', 'karrie', 'masha', 'chou', 'akai', 'valir'],
        s: ['layla', 'miya', 'hanabi', 'change', 'pharsa', 'lesley']),

    // 101. Belerick
    _h(
        'belerick',
        101,
        'Belerick',
        HeroRole.tank,
        [HeroLane.roam],
        'Control/Guard',
        'Nature guardian who punishes enemies for attacking him.',
        'Stand in front of your marksman. Use Ultimate to root all nearby enemies during teamfights.',
        const HeroStats(
            damage: 5,
            durability: 10,
            crowdControl: 8,
            mobility: 4,
            difficulty: 3),
        52,
        c: ['karrie', 'lunox', 'valir', 'baxia', 'dyrroth'],
        s: ['miya', 'layla', 'moskov', 'wanwan', 'claude', 'ixia']),

    // 102. Natan
    _h(
        'natan',
        102,
        'Natan',
        HeroRole.marksman,
        [HeroLane.gold, HeroLane.jungle],
        'Burst/Magic',
        'Space-time traveler with high magic damage and attack speed.',
        'Use Ultimate to create a clone. Position yourself so the clone doubles your damage on the target.',
        const HeroStats(
            damage: 10,
            durability: 3.5,
            crowdControl: 4,
            mobility: 8,
            difficulty: 8),
        53,
        c: ['saber', 'hayabusa', 'ling', 'lancelot', 'eudora', 'natalia'],
        s: ['tigreal', 'hylos', 'balmond', 'estes', 'lolita']),

    // 103. Floryn
    _h(
        'floryn',
        103,
        'Floryn',
        HeroRole.support,
        [HeroLane.roam],
        'Heal/Poke',
        'Global healer who can provide an extra item slot for an ally.',
        'Give the Dew\'s Gift to your core. Save your Ultimate for global healing and anti-anti-heal.',
        const HeroStats(
            damage: 4,
            durability: 4,
            crowdControl: 6,
            mobility: 5,
            difficulty: 3),
        54,
        c: ['natalia', 'helcurt', 'saber', 'ling', 'fanny', 'karina'],
        s: ['estes', 'rafaela', 'nana', 'layla', 'miya', 'baxia']),

    // 104. Chip
    _h(
        'chip',
        104,
        'Chip',
        HeroRole.tank,
        [HeroLane.roam],
        'Support/Initiator',
        'Portal master who brings the entire team to a single fight.',
        'Place portals strategically. Use your Ultimate to summon your teammates to gank isolated enemies.',
        const HeroStats(
            damage: 4.5,
            durability: 9,
            crowdControl: 9,
            mobility: 10,
            difficulty: 7),
        55,
        c: ['diggie', 'valir', 'akai', 'nana', 'khufra'],
        s: ['layla', 'miya', 'estes', 'pharsa', 'yve', 'cecilion']),

    // 105. Zhuxin
    _h(
        'zhuxin',
        105,
        'Zhuxin',
        HeroRole.mage,
        [HeroLane.mid],
        'Control/Poke',
        'Soul-shackling mage who can relocate enemies.',
        'Use your lantern to stack marks. Once full, pull the enemy towards your team or into the turret.',
        const HeroStats(
            damage: 8,
            durability: 5,
            crowdControl: 10,
            mobility: 6,
            difficulty: 7.5),
        53,
        c: ['helcurt', 'natalia', 'saber', 'ling', 'fanny', 'lancelot'],
        s: ['tigreal', 'hylos', 'balmond', 'estes', 'layla', 'miya']),

    // 106. Suyou
    _h(
        'suyou',
        106,
        'Suyou',
        HeroRole.assassin,
        [HeroLane.jungle, HeroLane.exp],
        'Burst/Chase',
        'Dual-stance warrior who switches between Mortal and Immortal forms.',
        'Hold skills for Immortal form (durability/CC) or tap for Mortal form (speed/burst).',
        const HeroStats(
            damage: 9.5,
            durability: 7,
            crowdControl: 7.5,
            mobility: 9,
            difficulty: 8.5),
        54,
        c: ['khufra', 'franco', 'kaja', 'saber', 'phoveus', 'minsitthar'],
        s: ['layla', 'miya', 'lesley', 'hanabi', 'gord', 'pharsa']),

    // 107. Lukas
    _h(
        'lukas',
        107,
        'Lukas',
        HeroRole.fighter,
        [HeroLane.exp],
        'Burst/Chase',
        'High-energy fighter who excels in continuous air combos.',
        'Build up energy to enter the enhanced state. Chain your skills to keep the enemy airborne.',
        const HeroStats(
            damage: 9,
            durability: 7.5,
            crowdControl: 8,
            mobility: 8.5,
            difficulty: 7),
        52,
        c: ['terizla', 'ruby', 'khufra', 'franco', 'dyrroth'],
        s: ['layla', 'miya', 'zilong', 'sun', 'alucard', 'badang']),

    // 108. Irithel
    _h(
        'irithel',
        108,
        'Irithel',
        HeroRole.marksman,
        [HeroLane.gold],
        'Burst/Chase',
        'Saber-riding marksman who shoots while moving.',
        'Always keep moving while attacking. Save your Ultimate for teamfights to gain AOE burst damage.',
        const HeroStats(
            damage: 9.5,
            durability: 3,
            crowdControl: 4,
            mobility: 9,
            difficulty: 4),
        50,
        c: ['saber', 'eudora', 'hayabusa', 'ling', 'fanny', 'lancelot'],
        s: ['tigreal', 'balmond', 'hylos', 'layla', 'miya', 'estes']),

    // 109. Clint
    _h(
        'clint',
        109,
        'Clint',
        HeroRole.marksman,
        [HeroLane.gold],
        'Burst/Poke',
        'Laning bully with massive passive damage after every skill.',
        'Use a skill then immediately basic attack to trigger your long-range passive poke.',
        const HeroStats(
            damage: 10,
            durability: 4,
            crowdControl: 5,
            mobility: 6,
            difficulty: 3.5),
        52,
        c: ['saber', 'ling', 'fanny', 'hayabusa', 'natalia', 'lancelot'],
        s: ['layla', 'miya', 'lesley', 'hanabi', 'karrie', 'ixia']),

    // 110. Roger
    _h(
        'roger',
        110,
        'Roger',
        HeroRole.fighter,
        [HeroLane.jungle, HeroLane.gold],
        'Burst/Reap',
        'Hybrid hunter who switches between human and wolf forms.',
        'Poke in human form. When the enemy is low on HP, switch to wolf form to execute.',
        const HeroStats(
            damage: 9,
            durability: 7,
            crowdControl: 3,
            mobility: 8,
            difficulty: 5.5),
        54,
        c: ['khufra', 'ruby', 'terizla', 'franco', 'minsitthar', 'baxia'],
        s: ['layla', 'miya', 'lesley', 'hanabi', 'gord', 'pharsa', 'estes']),

    // 111. Dyrroth
    _h(
        'dyrroth',
        111,
        'Dyrroth',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.jungle],
        'Burst/Charge',
        'Abyssal prince who shreds enemy physical defense.',
        'Use Skill 2 to break armor, then Skill 1 and Basic Attacks. Execute with Ultimate.',
        const HeroStats(
            damage: 10,
            durability: 6,
            crowdControl: 5,
            mobility: 7,
            difficulty: 4.5),
        54,
        c: ['ruby', 'chou', 'khufra', 'franco', 'thamuz'],
        s: ['hylos', 'tigreal', 'balmond', 'uranus', 'belerick']),

    // 112. Vexana
    _h(
        'vexana',
        112,
        'Vexana',
        HeroRole.mage,
        [HeroLane.mid],
        'Poke/Control',
        'Necromancy master who summons a giant Undead Knight.',
        'Use Skill 1 to terrify, Skill 2 for burst, then Ultimate to summon the Knight for tanking.',
        const HeroStats(
            damage: 9,
            durability: 4,
            crowdControl: 9,
            mobility: 3,
            difficulty: 4),
        53,
        c: ['lancelot', 'fanny', 'gusion', 'hayabusa', 'helcurt'],
        s: ['estes', 'tigreal', 'gloo', 'nana', 'layla']),

    // 113. Faramis
    _h(
        'faramis',
        113,
        'Faramis',
        HeroRole.support,
        [HeroLane.roam, HeroLane.mid],
        'Guard/Burst',
        'The savior of teamfights with soul-resurrection magic.',
        'Activate Ultimate during teamfights to give extra HP. Use Skill 1 to pull and displace enemies.',
        const HeroStats(
            damage: 7,
            durability: 6,
            crowdControl: 7,
            mobility: 8,
            difficulty: 6),
        55,
        c: ['valentina', 'kaja', 'franco', 'akai'],
        s: ['gloo', 'sun', 'tigreal', 'atlas', 'minotaur']),

    // 114. Alice
    _h(
        'alice',
        114,
        'Alice',
        HeroRole.mage,
        [HeroLane.mid, HeroLane.exp],
        'Regen/Charge',
        'Blood-draining queen who thrives in the center of teamfights.',
        'Blink in with Skill 1, activate Ultimate to drain HP, and use Skill 2 to pin enemies down.',
        const HeroStats(
            damage: 8.5,
            durability: 9,
            crowdControl: 6,
            mobility: 8,
            difficulty: 7.5),
        52,
        c: ['baxia', 'karrie', 'lunox', 'dyrroth', 'franco'],
        s: ['layla', 'miya', 'lesley', 'hanabi', 'pharsa']),

    // 115. Harley
    _h(
        'harley',
        115,
        'Harley',
        HeroRole.mage,
        [HeroLane.jungle, HeroLane.mid],
        'Burst/Poke',
        'Magical card genius with high mobility and outplay potential.',
        'Ult the target, spam Skill 1 cards, then use Skill 2 to blink back to safety.',
        const HeroStats(
            damage: 9.5,
            durability: 3,
            crowdControl: 3,
            mobility: 9,
            difficulty: 7.5),
        53,
        c: ['lolita', 'eudora', 'saber', 'khufra', 'nana'],
        s: ['layla', 'lesley', 'miya', 'gord', 'pharsa', 'ixia']),

    // 116. Kimmy
    _h(
        'kimmy',
        116,
        'Kimmy',
        HeroRole.marksman,
        [HeroLane.gold, HeroLane.jungle],
        'Damage/Poke',
        'Chemical scientist who provides continuous long-range spray damage.',
        'Keep moving while shooting to maintain pressure. Use Ultimate for long-range execution.',
        const HeroStats(
            damage: 9,
            durability: 3,
            crowdControl: 2,
            mobility: 8,
            difficulty: 8),
        50,
        c: ['lolita', 'belerick', 'saber', 'eudora', 'hayabusa'],
        s: ['hylos', 'tigreal', 'balmond', 'estes', 'uranus']),

    // 117. Grock
    _h(
        'grock',
        117,
        'Grock',
        HeroRole.tank,
        [HeroLane.roam, HeroLane.exp],
        'Initiator/Control',
        'Living fortress that becomes unstoppable near walls.',
        'Charge Skill 1 near a wall for CC immunity. Use Ultimate into walls for massive stuns.',
        const HeroStats(
            damage: 6.5,
            durability: 9.5,
            crowdControl: 8,
            mobility: 7,
            difficulty: 6),
        53,
        c: ['karrie', 'lunox', 'valir', 'baxia', 'dyrroth'],
        s: ['nana', 'layla', 'miya', 'gord', 'estes', 'pharsa']),

    // 118. Luo Yi
    _h(
        'luoyi',
        118,
        'Luo Yi',
        HeroRole.mage,
        [HeroLane.mid],
        'Burst/Support',
        'Yin-yang master who pulls enemies together with reactions.',
        'Alternate marks on enemies to trigger Yin-Yang reactions. Use Ult for quick team rotations.',
        const HeroStats(
            damage: 9.5,
            durability: 4,
            crowdControl: 9.5,
            mobility: 5,
            difficulty: 8.5),
        54,
        c: ['helcurt', 'saber', 'ling', 'fanny', 'lancelot', 'gusion'],
        s: ['estes', 'tigreal', 'atlas', 'minotaur', 'hylos']),

    // 119. Silvanna
    _h(
        'silvanna',
        119,
        'Silvanna',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.roam],
        'Initiator/Magic Burst',
        'Magic knight who locks enemies into a dueling circle.',
        'Ultimate the enemy core, then use Skill 2 to drill and damage while Skill 1 stuns.',
        const HeroStats(
            damage: 8.5,
            durability: 7,
            crowdControl: 8,
            mobility: 7.5,
            difficulty: 5.5),
        51,
        c: ['diggie', 'franco', 'kaja', 'chou', 'valir'],
        s: ['fanny', 'ling', 'lancelot', 'layla', 'miya', 'hanabi']),

    // 120. Aulus
    _h(
        'aulus',
        120,
        'Aulus',
        HeroRole.fighter,
        [HeroLane.jungle, HeroLane.exp],
        'Burst/Damage',
        'Hammer-wielding warrior whose power peaks in the late game.',
        'Focus on farming until Level 12. Use your Ultimate to create burning paths in teamfights.',
        const HeroStats(
            damage: 10,
            durability: 7.5,
            crowdControl: 4,
            mobility: 7,
            difficulty: 6),
        50,
        c: ['dyrroth', 'karrie', 'valir', 'saber', 'eudora'],
        s: ['sun', 'alucard', 'zilong', 'balmond', 'layla']),

    // 121. Bane
    _h(
        'bane',
        121,
        'Bane',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.jungle],
        'Push/Burst',
        'Hybrid fighter who uses deadly splashes and mechanical sharks.',
        'Spam Skill 1 for poke. Use Ultimate to knock up enemies and melt turrets with true damage.',
        const HeroStats(
            damage: 9,
            durability: 6.5,
            crowdControl: 7,
            mobility: 5,
            difficulty: 4),
        51,
        c: ['karrie', 'lunox', 'valir', 'baxia', 'chou'],
        s: ['layla', 'miya', 'hanabi', 'estes', 'sun']),

    // 122. Rafaela
    _h(
        'rafaela',
        122,
        'Rafaela',
        HeroRole.support,
        [HeroLane.roam],
        'Heal/Poke',
        'Angelic support who provides speed and constant slows.',
        'Spam Skill 1 to reveal hidden enemies. Use Ultimate for a straight-line stun in teamfights.',
        const HeroStats(
            damage: 4,
            durability: 4.5,
            crowdControl: 7,
            mobility: 7.5,
            difficulty: 3),
        53,
        c: ['natalia', 'helcurt', 'saber', 'ling', 'fanny'],
        s: ['estes', 'nana', 'layla', 'miya', 'natalia']),

    // 123. Yi Sun-Shin
    _h(
        'yisunshin',
        123,
        'Yi Sun-Shin',
        HeroRole.assassin,
        [HeroLane.jungle],
        'Burst/Reap',
        'Versatile leader who switches between melee and ranged attacks.',
        'Switch between sword and bow to trigger critical passive. Use Ult for map vision.',
        const HeroStats(
            damage: 9.5,
            durability: 4,
            crowdControl: 2,
            mobility: 8,
            difficulty: 8.5),
        52,
        c: ['khufra', 'franco', 'saber', 'eudora', 'nana'],
        s: ['layla', 'miya', 'lesley', 'hanabi', 'pharsa']),

    // 124. Hilda
    _h(
        'hilda',
        124,
        'Hilda',
        HeroRole.fighter,
        [HeroLane.exp, HeroLane.roam],
        'Burst/Regen',
        'Bush predator who regenerates health by staying in bushes.',
        'Hide in bushes to bait enemies. Stack your Ultimate by getting kills or assists for massive damage.',
        const HeroStats(
            damage: 8.5,
            durability: 9,
            crowdControl: 5,
            mobility: 7.5,
            difficulty: 3.5),
        50,
        c: ['karrie', 'lunox', 'valir', 'baxia', 'dyrroth'],
        s: ['layla', 'miya', 'lesley', 'estes', 'pharsa', 'ixia']),

    // 125. Vale
    _h(
        'vale',
        125,
        'Vale',
        HeroRole.mage,
        [HeroLane.mid],
        'Burst/Control',
        'Wind mage who can upgrade his skills for damage or CC.',
        'Choose CC upgrades for teamfights. Combine Skill 2 knock-up with Ultimate for instant kills.',
        const HeroStats(
            damage: 10,
            durability: 2.5,
            crowdControl: 9,
            mobility: 7,
            difficulty: 5.5),
        53,
        c: ['lancelot', 'fanny', 'ling', 'hayabusa', 'saber'],
        s: ['tigreal', 'estes', 'balmond', 'layla', 'miya', 'atlas']),

    // 126. Leomord
    _h(
        'leomord',
        126,
        'Leomord',
        HeroRole.fighter,
        [HeroLane.jungle, HeroLane.exp],
        'Burst/Chase',
        'Undead knight who becomes unstoppable on his phantom horse.',
        'Use Ultimate to summon Barbiel. You gain extra defense and critical hits on low-HP enemies.',
        const HeroStats(
            damage: 9,
            durability: 8,
            crowdControl: 6,
            mobility: 8.5,
            difficulty: 6),
        52,
        c: ['khufra', 'minsitthar', 'valir', 'akai', 'nana'],
        s: ['layla', 'miya', 'lesley', 'hanabi', 'gord', 'estes']),

    // 127. Mathilda
    _h(
        'mathilda',
        127,
        'Mathilda',
        HeroRole.support,
        [HeroLane.roam, HeroLane.mid],
        'Burst/Support',
        'High-mobility guide who provides free dashes for teammates.',
        'Use Skill 2 to help your allies escape or dive. Use Ultimate to lock and knock up the enemy core.',
        const HeroStats(
            damage: 8,
            durability: 6,
            crowdControl: 7,
            mobility: 10,
            difficulty: 7.5),
        55,
        c: ['khufra', 'minsitthar', 'phoveus', 'saber', 'eudora'],
        s: ['layla', 'miya', 'pharsa', 'yve', 'cecilion', 'ixia']),

    // 128. Kalea
    _h(
        'kalea',
        128,
        'Kalea',
        HeroRole.support, // Hybrid Fighter
        [HeroLane.roam],
        'Control/Regen',
        'Sea-based protector who uses surging waves to heal and displace.',
        'Use your waves to provide continuous regen for the frontline. Follow up with CC to lock enemies.',
        const HeroStats(
            damage: 6,
            durability: 8.5,
            crowdControl: 9,
            mobility: 7,
            difficulty: 5),
        54,
        c: ['baxia', 'dyrroth', 'valir', 'karrie'],
        s: ['estes', 'tigreal', 'atlas', 'pharsa', 'odette']),

    // 129. Zetian
    _h(
        'zetian',
        129,
        'Zetian',
        HeroRole.mage,
        [HeroLane.mid],
        'Damage/Crowd Control',
        'Celestial empress who dominates the battlefield with divine magic.',
        'Position your celestial seals to maximize CC. Use your burst combo to wipe out grouped enemies.',
        const HeroStats(
            damage: 10,
            durability: 3,
            crowdControl: 9.5,
            mobility: 4.5,
            difficulty: 7.5),
        53,
        c: ['ling', 'fanny', 'helcurt', 'saber', 'lancelot'],
        s: ['tigreal', 'hylos', 'balmond', 'layla', 'miya', 'estes']),

    // 130. Obsidia
    _h(
        'obsidia',
        130,
        'Obsidia',
        HeroRole.marksman,
        [HeroLane.gold],
        'Finisher/Damage',
        'Sovereign of the Abyss who executes targets with dark energy.',
        'Stay at maximum range. Wait for enemies to fall below 30% HP to trigger your finisher passive.',
        const HeroStats(
            damage: 10,
            durability: 4,
            crowdControl: 4,
            mobility: 7.5,
            difficulty: 6.5),
        55,
        c: ['saber', 'hayabusa', 'ling', 'fanny', 'natalia', 'eudora'],
        s: ['balmond', 'hylos', 'uranus', 'miya', 'layla', 'lesley']),

    // 131. Sora
    _h(
        'sora',
        131,
        'Sora',
        HeroRole.fighter, // Hybrid Assassin
        [HeroLane.exp],
        'Charge/Burst',
        'Cloud-shifting warrior with unpredictable dash patterns.',
        'Chain your dashes to stack damage. Dive the backline and burst the marksman before they can react.',
        const HeroStats(
            damage: 9.5,
            durability: 7,
            crowdControl: 6.5,
            mobility: 10,
            difficulty: 9),
        54,
        c: ['khufra', 'minsitthar', 'phoveus', 'franco', 'kaja', 'nana'],
        s: ['layla', 'miya', 'lesley', 'hanabi', 'pharsa', 'ixia']),
  ];

  static List<HeroModel> getAllHeroes() => allHeroes;

  static HeroModel? getHeroById(String id) {
    try {
      return allHeroes.firstWhere((hero) => hero.id == id);
    } catch (e) {
      return null;
    }
  }

  // متد کمکی با آدرس‌دهی خودکار به فرمت .webp
  static HeroModel _h(
      String id,
      int gId,
      String n,
      HeroRole r,
      List<HeroLane> l,
      String spec,
      String ai,
      String guide,
      HeroStats stats,
      int win,
      {List<String> c = const [],
      List<String> s = const []}) {
    return HeroModel(
      id: id,
      gameId: gId,
      name: n,
      role: r,
      preferredLanes: l,
      imagePath: 'assets/images/heroes/$id.webp', // اصلاح به فرمت webp
      specialty: spec,
      aiDescription: ai,
      teamfightGuide: guide,
      stats: stats,
      winProbabilityBase: win,
      counterHeroIds: c,
      strongAgainstHeroIds: s,
    );
  }
}
