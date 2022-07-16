rule win_dustman_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.dustman."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.dustman"
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
        $sequence_0 = { 8bf8 85c0 0f8453020000 4c8d2d9a0c0100 }
            // n = 4, score = 100
            //   8bf8                 | or                  edx, eax
            //   85c0                 | movzx               edi, byte ptr [ebp + 0x1fe]
            //   0f8453020000         | dec                 eax
            //   4c8d2d9a0c0100       | shl                 edi, 8

        $sequence_1 = { 742a 488bc5 4c8d058d110100 488bcd }
            // n = 4, score = 100
            //   742a                 | dec                 eax
            //   488bc5               | lea                 edx, [0x17516]
            //   4c8d058d110100       | mov                 ecx, eax
            //   488bcd               | test                eax, eax

        $sequence_2 = { 837b1000 75dd 488d056be30000 483bd8 }
            // n = 4, score = 100
            //   837b1000             | test                eax, eax
            //   75dd                 | dec                 eax
            //   488d056be30000       | lea                 edx, [0x18fdf]
            //   483bd8               | dec                 eax

        $sequence_3 = { 488bca 492bca 4c8d9dd6010000 4903cb 48898db0000000 }
            // n = 5, score = 100
            //   488bca               | movzx               ecx, byte ptr [ecx + eax]
            //   492bca               | mov                 byte ptr [eax + 0x21], cl
            //   4c8d9dd6010000       | mov                 byte ptr [eax + 0x22], cl
            //   4903cb               | dec                 eax
            //   48898db0000000       | mov                 ecx, dword ptr [ebp + 0x18]

        $sequence_4 = { 0fb60c01 884831 488b8d90000000 0fb60c01 884832 488b8d98000000 0fb60c01 }
            // n = 7, score = 100
            //   0fb60c01             | xor                 esi, esi
            //   884831               | dec                 eax
            //   488b8d90000000       | arpl                si, cx
            //   0fb60c01             | dec                 eax
            //   884832               | lea                 edi, [0x11114]
            //   488b8d98000000       | dec                 eax
            //   0fb60c01             | mov                 eax, ecx

        $sequence_5 = { 4903cb 48894d28 488bca 492bca 4c8d9dc6010000 4903cb }
            // n = 6, score = 100
            //   4903cb               | mov                 ecx, edx
            //   48894d28             | dec                 ecx
            //   488bca               | sub                 ecx, edx
            //   492bca               | dec                 esp
            //   4c8d9dc6010000       | lea                 ebx, [ebp + 0x1dd]
            //   4903cb               | dec                 ecx

        $sequence_6 = { 4885c0 7509 488d05df420100 eb04 4883c024 8938 }
            // n = 6, score = 100
            //   4885c0               | dec                 eax
            //   7509                 | sub                 esp, 0xd00
            //   488d05df420100       | dec                 eax
            //   eb04                 | mov                 dword ptr [ebp + 0x178], 0xfffffffe
            //   4883c024             | dec                 eax
            //   8938                 | mov                 dword ptr [eax + 8], ebx

        $sequence_7 = { e9???????? 488d0583e00000 4a8b0ce8 42385cf938 7d4f 400fbece 4084f6 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   488d0583e00000       | movzx               ecx, byte ptr [ecx + eax]
            //   4a8b0ce8             | mov                 byte ptr [eax + 0x3d], cl
            //   42385cf938           | dec                 eax
            //   7d4f                 | mov                 ecx, dword ptr [ebp + 0xf0]
            //   400fbece             | movzx               ecx, byte ptr [ecx + eax]
            //   4084f6               | mov                 byte ptr [eax + 0x3e], cl

        $sequence_8 = { 4c8d9de4010000 4903cb 48898d20010000 488bca 492bca 4c8d9de5010000 4903cb }
            // n = 7, score = 100
            //   4c8d9de4010000       | movzx               ecx, byte ptr [ecx + eax]
            //   4903cb               | mov                 byte ptr [eax + 0x10], cl
            //   48898d20010000       | dec                 eax
            //   488bca               | mov                 ecx, dword ptr [ebp - 0x78]
            //   492bca               | movzx               ecx, byte ptr [ecx + eax]
            //   4c8d9de5010000       | mov                 byte ptr [eax + 0x11], cl
            //   4903cb               | dec                 eax

        $sequence_9 = { e9???????? 4d8bb4f6d0320100 33d2 498bce 41b800080000 }
            // n = 5, score = 100
            //   e9????????           |                     
            //   4d8bb4f6d0320100     | dec                 eax
            //   33d2                 | mov                 ecx, dword ptr [ebp + 0xe0]
            //   498bce               | movzx               ecx, byte ptr [ecx + eax]
            //   41b800080000         | mov                 byte ptr [eax + 0x3c], cl

    condition:
        7 of them and filesize < 368640
}