rule win_medusalocker_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.medusalocker."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.medusalocker"
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
        $sequence_0 = { 33c5 8945fc 898decfdffff 8b8decfdffff }
            // n = 4, score = 400
            //   33c5                 | xor                 eax, ebp
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   898decfdffff         | mov                 dword ptr [ebp - 0x214], ecx
            //   8b8decfdffff         | mov                 ecx, dword ptr [ebp - 0x214]

        $sequence_1 = { 8b4de8 83c10c e8???????? 8bc8 e8???????? eb16 8b4de8 }
            // n = 7, score = 400
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]
            //   83c10c               | add                 ecx, 0xc
            //   e8????????           |                     
            //   8bc8                 | mov                 ecx, eax
            //   e8????????           |                     
            //   eb16                 | jmp                 0x18
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]

        $sequence_2 = { 8d4dd8 51 e8???????? 83c410 50 8b4dd0 e8???????? }
            // n = 7, score = 400
            //   8d4dd8               | lea                 ecx, [ebp - 0x28]
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c410               | add                 esp, 0x10
            //   50                   | push                eax
            //   8b4dd0               | mov                 ecx, dword ptr [ebp - 0x30]
            //   e8????????           |                     

        $sequence_3 = { c745e002000000 8b55e8 c7420402000000 8b4de8 81c1c8000000 e8???????? }
            // n = 6, score = 400
            //   c745e002000000       | mov                 dword ptr [ebp - 0x20], 2
            //   8b55e8               | mov                 edx, dword ptr [ebp - 0x18]
            //   c7420402000000       | mov                 dword ptr [edx + 4], 2
            //   8b4de8               | mov                 ecx, dword ptr [ebp - 0x18]
            //   81c1c8000000         | add                 ecx, 0xc8
            //   e8????????           |                     

        $sequence_4 = { c1e100 ba3a000000 6689540de8 c745cc04010000 6a00 }
            // n = 5, score = 400
            //   c1e100               | shl                 ecx, 0
            //   ba3a000000           | mov                 edx, 0x3a
            //   6689540de8           | mov                 word ptr [ebp + ecx - 0x18], dx
            //   c745cc04010000       | mov                 dword ptr [ebp - 0x34], 0x104
            //   6a00                 | push                0

        $sequence_5 = { e8???????? 8945d0 8b4d08 8b55d0 8d044a 8945dc }
            // n = 6, score = 400
            //   e8????????           |                     
            //   8945d0               | mov                 dword ptr [ebp - 0x30], eax
            //   8b4d08               | mov                 ecx, dword ptr [ebp + 8]
            //   8b55d0               | mov                 edx, dword ptr [ebp - 0x30]
            //   8d044a               | lea                 eax, [edx + ecx*2]
            //   8945dc               | mov                 dword ptr [ebp - 0x24], eax

        $sequence_6 = { 8b4508 83e001 740e 6a7c 8b4dfc 51 e8???????? }
            // n = 7, score = 400
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]
            //   83e001               | and                 eax, 1
            //   740e                 | je                  0x10
            //   6a7c                 | push                0x7c
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   51                   | push                ecx
            //   e8????????           |                     

        $sequence_7 = { 741c 6a01 8b4de4 e8???????? 50 8d4de8 e8???????? }
            // n = 7, score = 400
            //   741c                 | je                  0x1e
            //   6a01                 | push                1
            //   8b4de4               | mov                 ecx, dword ptr [ebp - 0x1c]
            //   e8????????           |                     
            //   50                   | push                eax
            //   8d4de8               | lea                 ecx, [ebp - 0x18]
            //   e8????????           |                     

        $sequence_8 = { 50 8d45f4 64a300000000 c745d400000000 8b450c 50 }
            // n = 6, score = 400
            //   50                   | push                eax
            //   8d45f4               | lea                 eax, [ebp - 0xc]
            //   64a300000000         | mov                 dword ptr fs:[0], eax
            //   c745d400000000       | mov                 dword ptr [ebp - 0x2c], 0
            //   8b450c               | mov                 eax, dword ptr [ebp + 0xc]
            //   50                   | push                eax

        $sequence_9 = { 83c108 51 ff15???????? 85c0 7539 ff15???????? }
            // n = 6, score = 400
            //   83c108               | add                 ecx, 8
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   7539                 | jne                 0x3b
            //   ff15????????         |                     

    condition:
        7 of them and filesize < 1433600
}