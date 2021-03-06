rule win_ksl0t_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.ksl0t."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.ksl0t"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 83780436 0f84c6090000 488b442450 8378041d 0f84b7090000 }
            // n = 5, score = 200
            //   83780436             | dec                 eax
            //   0f84c6090000         | add                 edx, 0x24
            //   488b442450           | cmp                 dword ptr [eax + 4], 0x36
            //   8378041d             | je                  0x9cc
            //   0f84b7090000         | dec                 eax

        $sequence_1 = { 33c0 8d642400 308c04dc020000 40 83f819 }
            // n = 5, score = 200
            //   33c0                 | xor                 eax, eax
            //   8d642400             | lea                 esp, [esp]
            //   308c04dc020000       | xor                 byte ptr [esp + eax + 0x2dc], cl
            //   40                   | inc                 eax
            //   83f819               | cmp                 eax, 0x19

        $sequence_2 = { b801000000 4883c450 5d c3 4055 }
            // n = 5, score = 200
            //   b801000000           | mov                 edi, dword ptr [ebx]
            //   4883c450             | dec                 eax
            //   5d                   | test                edi, edi
            //   c3                   | mov                 ecx, 0x43
            //   4055                 | inc                 ecx

        $sequence_3 = { 66899500100000 68fe030000 52 8d8502100000 }
            // n = 4, score = 200
            //   66899500100000       | mov                 word ptr [ebp + 0x1000], dx
            //   68fe030000           | push                0x3fe
            //   52                   | push                edx
            //   8d8502100000         | lea                 eax, [ebp + 0x1002]

        $sequence_4 = { a3???????? a3???????? 68???????? 6a00 6a02 ff15???????? 68???????? }
            // n = 7, score = 200
            //   a3????????           |                     
            //   a3????????           |                     
            //   68????????           |                     
            //   6a00                 | push                0
            //   6a02                 | push                2
            //   ff15????????         |                     
            //   68????????           |                     

        $sequence_5 = { ff15???????? eb51 488d157cdd0000 488d8c24b0020000 ff15???????? 488d15a3af0000 }
            // n = 6, score = 200
            //   ff15????????         |                     
            //   eb51                 | mov                 eax, dword ptr [esp + 0x50]
            //   488d157cdd0000       | cmp                 dword ptr [eax + 4], 0x1d
            //   488d8c24b0020000     | je                  0x9c1
            //   ff15????????         |                     
            //   488d15a3af0000       | jmp                 0x53

        $sequence_6 = { 50 68???????? e8???????? 83c40c 8b9510150000 }
            // n = 5, score = 200
            //   50                   | push                eax
            //   68????????           |                     
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   8b9510150000         | mov                 edx, dword ptr [ebp + 0x1510]

        $sequence_7 = { 0f8579ffffff b931000000 b8???????? 2bc1 8944241c b8???????? }
            // n = 6, score = 200
            //   0f8579ffffff         | jne                 0xffffff7f
            //   b931000000           | mov                 ecx, 0x31
            //   b8????????           |                     
            //   2bc1                 | sub                 eax, ecx
            //   8944241c             | mov                 dword ptr [esp + 0x1c], eax
            //   b8????????           |                     

        $sequence_8 = { 88842450020000 889c2451020000 c684245202000073 c68424530200006c c684245402000065 }
            // n = 5, score = 200
            //   88842450020000       | mov                 byte ptr [esp + 0x250], al
            //   889c2451020000       | mov                 byte ptr [esp + 0x251], bl
            //   c684245202000073     | mov                 byte ptr [esp + 0x252], 0x73
            //   c68424530200006c     | mov                 byte ptr [esp + 0x253], 0x6c
            //   c684245402000065     | mov                 byte ptr [esp + 0x254], 0x65

        $sequence_9 = { c68424e60200007b c68424e702000031 c68424e802000039 c68424e902000039 }
            // n = 4, score = 200
            //   c68424e60200007b     | sub                 esp, 0x20
            //   c68424e702000031     | dec                 eax
            //   c68424e802000039     | lea                 ebx, [0xc807]
            //   c68424e902000039     | dec                 eax

        $sequence_10 = { 57 4883ec20 488d1d07c80000 488b3b 4885ff }
            // n = 5, score = 200
            //   57                   | dec                 eax
            //   4883ec20             | lea                 edx, [0xafa3]
            //   488d1d07c80000       | mov                 byte ptr [esp + 0x30b], 0x2c
            //   488b3b               | mov                 byte ptr [esp + 0x30c], 0x26
            //   4885ff               | mov                 byte ptr [esp + 0x30d], 0x21

        $sequence_11 = { ff15???????? 8d55c8 52 8d45b8 50 ff15???????? }
            // n = 6, score = 200
            //   ff15????????         |                     
            //   8d55c8               | lea                 edx, [ebp - 0x38]
            //   52                   | push                edx
            //   8d45b8               | lea                 eax, [ebp - 0x48]
            //   50                   | push                eax
            //   ff15????????         |                     

        $sequence_12 = { b943000000 e8???????? 41b810000000 488d1575d90000 }
            // n = 4, score = 200
            //   b943000000           | mov                 byte ptr [esp + 0x30e], 0x30
            //   e8????????           |                     
            //   41b810000000         | push                edi
            //   488d1575d90000       | dec                 eax

        $sequence_13 = { c684240b0300002c c684240c03000026 c684240d03000021 c684240e03000030 }
            // n = 4, score = 200
            //   c684240b0300002c     | dec                 eax
            //   c684240c03000026     | lea                 edx, [0xdd7c]
            //   c684240d03000021     | dec                 eax
            //   c684240e03000030     | lea                 ecx, [esp + 0x2b0]

        $sequence_14 = { ff15???????? c705????????00000000 eb52 488d155cc70000 4883c224 }
            // n = 5, score = 200
            //   ff15????????         |                     
            //   c705????????00000000     |     
            //   eb52                 | jmp                 0x54
            //   488d155cc70000       | dec                 eax
            //   4883c224             | lea                 edx, [0xc75c]

        $sequence_15 = { c68424d90100003e c68424da01000010 c68424db0100002d c68424dc01000002 888c24dd010000 c684240802000000 c68424090200003b }
            // n = 7, score = 200
            //   c68424d90100003e     | mov                 byte ptr [esp + 0x1d9], 0x3e
            //   c68424da01000010     | mov                 byte ptr [esp + 0x1da], 0x10
            //   c68424db0100002d     | mov                 byte ptr [esp + 0x1db], 0x2d
            //   c68424dc01000002     | mov                 byte ptr [esp + 0x1dc], 2
            //   888c24dd010000       | mov                 byte ptr [esp + 0x1dd], cl
            //   c684240802000000     | mov                 byte ptr [esp + 0x208], 0
            //   c68424090200003b     | mov                 byte ptr [esp + 0x209], 0x3b

    condition:
        7 of them and filesize < 196608
}