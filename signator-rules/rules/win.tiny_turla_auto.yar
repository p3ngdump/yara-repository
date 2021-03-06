rule win_tiny_turla_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.tiny_turla."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.tiny_turla"
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
        $sequence_0 = { 488bd7 e8???????? 488b4dd0 488d159e090000 4883c142 41b818000000 4803cb }
            // n = 7, score = 100
            //   488bd7               | dec                 eax
            //   e8????????           |                     
            //   488b4dd0             | mov                 edi, dword ptr [esp + 0x30]
            //   488d159e090000       | dec                 eax
            //   4883c142             | add                 esp, 0x38
            //   41b818000000         | inc                 ecx
            //   4803cb               | pop                 edi

        $sequence_1 = { 48896c2410 4889742418 48897c2420 4154 4156 4157 4881ece0000000 }
            // n = 7, score = 100
            //   48896c2410           | dec                 eax
            //   4889742418           | mov                 edx, edi
            //   48897c2420           | dec                 eax
            //   4154                 | mov                 dword ptr [esp + 0x50], eax
            //   4156                 | dec                 eax
            //   4157                 | test                eax, eax
            //   4881ece0000000       | jne                 0x10b6

        $sequence_2 = { e8???????? 4889442440 4885c0 7431 488d4c2478 4533c9 }
            // n = 6, score = 100
            //   e8????????           |                     
            //   4889442440           | inc                 ecx
            //   4885c0               | cmp                 edi, esi
            //   7431                 | jb                  0xffffffd8
            //   488d4c2478           | inc                 edi
            //   4533c9               | mov                 word ptr [esi + ebx*8 + 8], ax

        $sequence_3 = { 0f84c4feffff 8bc8 e8???????? 498906 488bcb 4885c0 }
            // n = 6, score = 100
            //   0f84c4feffff         | mov                 eax, dword ptr [ebp - 0x79]
            //   8bc8                 | lea                 edx, [edi + edi]
            //   e8????????           |                     
            //   498906               | dec                 eax
            //   488bcb               | mov                 ecx, dword ptr [eax + edx*8]
            //   4885c0               | lea                 eax, [edx + 1]

        $sequence_4 = { e9???????? 4584ed 757e 488bcf e8???????? 413bc6 7404 }
            // n = 7, score = 100
            //   e9????????           |                     
            //   4584ed               | dec                 eax
            //   757e                 | lea                 eax, [esp + 0x78]
            //   488bcf               | dec                 eax
            //   e8????????           |                     
            //   413bc6               | mov                 dword ptr [esp + 0x28], eax
            //   7404                 | dec                 esp

        $sequence_5 = { 32db e9???????? 448b6e0c 488b5e38 }
            // n = 4, score = 100
            //   32db                 | inc                 esp
            //   e9????????           |                     
            //   448b6e0c             | mov                 dword ptr [esp + 0x28], esi
            //   488b5e38             | jne                 0xc1

        $sequence_6 = { 66894308 488d5b10 413bfe 72d3 488d5e18 488bcb }
            // n = 6, score = 100
            //   66894308             | inc                 ecx
            //   488d5b10             | mov                 dword ptr [esp], ecx
            //   413bfe               | dec                 ecx
            //   72d3                 | mov                 dword ptr [edi], eax
            //   488d5e18             | dec                 eax
            //   488bcb               | test                eax, eax

        $sequence_7 = { 33d2 488d4d80 448d4218 e8???????? 33db }
            // n = 5, score = 100
            //   33d2                 | lea                 ecx, [ebp - 0x10]
            //   488d4d80             | dec                 ebp
            //   448d4218             | test                ebp, ebp
            //   e8????????           |                     
            //   33db                 | je                  0x6dd

        $sequence_8 = { 4156 4157 4881ece0000000 4c8d7a20 488be9 498b0f 488bda }
            // n = 7, score = 100
            //   4156                 | xor                 edx, edx
            //   4157                 | inc                 esp
            //   4881ece0000000       | mov                 dword ptr [esp + 0x20], esp
            //   4c8d7a20             | dec                 eax
            //   488be9               | mov                 ecx, ebx
            //   498b0f               | inc                 esp
            //   488bda               | mov                 dword ptr [ebp + 0x7f], ebp

        $sequence_9 = { 48c703ffffffff 488b4b08 4883f9ff 740e ff15???????? 48c74308ffffffff 488b4b18 }
            // n = 7, score = 100
            //   48c703ffffffff       | dec                 eax
            //   488b4b08             | cmp                 eax, -1
            //   4883f9ff             | jne                 0x40e
            //   740e                 | mov                 bl, 6
            //   ff15????????         |                     
            //   48c74308ffffffff     | inc                 esp
            //   488b4b18             | sub                 esi, esi

    condition:
        7 of them and filesize < 51200
}